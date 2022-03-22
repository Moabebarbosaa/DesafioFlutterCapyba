import 'dart:io';
import 'package:desafio_capyba/helpers/extensions.dart';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/repository/user_repository.dart';
import 'package:desafio_capyba/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @computed
  bool get formKeyValid => formKey.currentState!.validate() && imgFileValid;

  @observable
  File? imgFile;

  @action
  Future<void> setImgFile() async {
    final img = await ImagePicker()
          .pickImage(source: ImageSource.camera);
      if (img != null) {
        imgFile = File(img.path);
      }
  }

  @computed
  bool get imgFileValid => imgFile != null;

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

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email.isEmailValid();
  String? get emailError {
    if (email.isEmpty) {
      return 'Campo obrigatório';
    } else if (!emailValid) {
      return 'E-mail inválido';
    }
    return null;
  }

  @observable
  String pass = '';

  @action
  void setPass(String value) => pass = value;

  @computed
  bool get passValid => pass.length >= 6;
  String? get passError {
    if (pass.isEmpty) {
      return 'Campo obrigatório';
    } else if (!passValid){
      return 'Senha muito curta';
    }
    return null;
  }

  @observable
  bool loading = false;

  @observable
  bool errorSignUp = false;

  @observable
  String error = '';

  @action
  setError(String value) => error = value;

  @action
  Future<void> signUp(VoidCallback onSuccess, VoidCallback onFail) async {
    loading = true;

    var user = UserModel(name: name, email: email, pass: pass, id: '', img: '', emailVerified: false);
    try {
      user = await UserRepository().signUp(user, imgFile!);
      GetIt.I<UserManagerStore>().setUser(UserModel(name: user.name, email: user.email, id: user.id, img: user.img, emailVerified: user.emailVerified));
      errorSignUp = false;
      onSuccess();
    } catch (e) {
      onFail();
      setError(e.toString());
      print('SignUpStore | $e');
      errorSignUp = true;
    }

    loading = false;
  }
}
