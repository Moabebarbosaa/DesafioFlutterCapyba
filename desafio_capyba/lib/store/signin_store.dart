import 'dart:io';
import 'package:desafio_capyba/helpers/extensions.dart';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/repository/user_repository.dart';
import 'package:desafio_capyba/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'signin_store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @computed
  bool get formKeyValid => formKey.currentState!.validate();

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email.isEmailValid();
  String? get emailError {
    if (email.isEmpty) {
      return 'Campo obrigatório';
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
    }
    return null;
  }

  @observable
  bool loading = false;

  @observable
  bool errorSignIn = false;

  @observable
  String error = '';

  @action
  setError(String value) => error = value;

  @action
  Future<void> signIn(VoidCallback onSuccess, VoidCallback onFail) async {
    loading = true;

    var user = UserModel(name: '', email: email, pass: pass, id: '', img: '', emailVerified: false);
    try {
      user = await UserRepository().signIn(user);
      GetIt.I<UserManagerStore>().setUser(UserModel(name: user.name!, email: user.email, id: user.id, img: user.img, emailVerified: user.emailVerified));
      errorSignIn = false;
      onSuccess();
    } catch (e) {
      onFail();
      setError(e.toString());
      print('SignUpStore.signIn | $e');
      errorSignIn = true;
    }

    loading = false;
  }
}
