import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/repository/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {

  _UserManagerStore() {
    _getCurrentUser();
  }

  @observable
  UserModel? user;

  @action
  void setUser(UserModel value) => user = value;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().fetchCurrentUser();
    setUser(user);
  }

  Future<void> sendEmailVerification() async {
    await UserRepository().sendEmailVerification();

  }


}
