// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStore, Store {
  Computed<bool>? _$formKeyValidComputed;

  @override
  bool get formKeyValid =>
      (_$formKeyValidComputed ??= Computed<bool>(() => super.formKeyValid,
              name: '_SignInStore.formKeyValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignInStore.emailValid'))
          .value;
  Computed<bool>? _$passValidComputed;

  @override
  bool get passValid => (_$passValidComputed ??=
          Computed<bool>(() => super.passValid, name: '_SignInStore.passValid'))
      .value;

  final _$formKeyAtom = Atom(name: '_SignInStore.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignInStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passAtom = Atom(name: '_SignInStore.pass');

  @override
  String get pass {
    _$passAtom.reportRead();
    return super.pass;
  }

  @override
  set pass(String value) {
    _$passAtom.reportWrite(value, super.pass, () {
      super.pass = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignInStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorSignInAtom = Atom(name: '_SignInStore.errorSignIn');

  @override
  bool get errorSignIn {
    _$errorSignInAtom.reportRead();
    return super.errorSignIn;
  }

  @override
  set errorSignIn(bool value) {
    _$errorSignInAtom.reportWrite(value, super.errorSignIn, () {
      super.errorSignIn = value;
    });
  }

  final _$errorAtom = Atom(name: '_SignInStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_SignInStore.signIn');

  @override
  Future<void> signIn(VoidCallback onSuccess, VoidCallback onFail) {
    return _$signInAsyncAction.run(() => super.signIn(onSuccess, onFail));
  }

  final _$_SignInStoreActionController = ActionController(name: '_SignInStore');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.setPass');
    try {
      return super.setPass(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
email: ${email},
pass: ${pass},
loading: ${loading},
errorSignIn: ${errorSignIn},
error: ${error},
formKeyValid: ${formKeyValid},
emailValid: ${emailValid},
passValid: ${passValid}
    ''';
  }
}
