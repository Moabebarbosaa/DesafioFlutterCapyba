import 'package:desafio_capyba/store/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'restricted_store.g.dart';

class RestrictedStore = _RestrictedStore with _$RestrictedStore;

abstract class _RestrictedStore with Store {

  @observable
  bool valid = false;

  @action
  void setValid(bool value) => valid = value;

  @computed
  String get pageIsValid {
    bool? valid = GetIt.I<UserManagerStore>().user?.emailVerified;
    if (valid != null && valid) {
      return 'LIBERADO!';
    } else {
      return 'CONTEÚDO BLOQUEADO!';
    }
  }

}