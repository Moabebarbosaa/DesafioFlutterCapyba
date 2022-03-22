import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../repository/user_repository.dart';

part 'edit_profile_store.g.dart';

class EditProfileStore = _EditProfileStore with _$EditProfileStore;

abstract class _EditProfileStore with Store {

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @computed
  bool get formKeyValid => formKey.currentState!.validate();

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name.length > 6;
  String? get nameError {
    if (name.isEmpty) {
      return 'Campo obrigatório';
    } else if(!nameValid) {
      return 'Nome muito curto';
    }
    return null;
  }

  @action
  Future<void> setNameFirebase(VoidCallback onSuccess, VoidCallback onFail) async {
    try {
      UserModel user = await UserRepository().updateName(name);
      print(user);
      GetIt.I<UserManagerStore>().setUser(UserModel(name: user.name, email: user.email, id: user.id, img: user.img, emailVerified: user.emailVerified));
      onSuccess();
    } catch (e) {
      onFail();
      print('EditProfile.setNameFirebase | $e');
    }
  }

}