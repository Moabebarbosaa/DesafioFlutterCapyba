// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  Computed<bool>? _$formKeyValidComputed;

  @override
  bool get formKeyValid =>
      (_$formKeyValidComputed ??= Computed<bool>(() => super.formKeyValid,
              name: '_SignUpStore.formKeyValid'))
          .value;
  Computed<bool>? _$imgFileValidComputed;

  @override
  bool get imgFileValid =>
      (_$imgFileValidComputed ??= Computed<bool>(() => super.imgFileValid,
              name: '_SignUpStore.imgFileValid'))
          .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid => (_$nameValidComputed ??=
          Computed<bool>(() => super.nameValid, name: '_SignUpStore.nameValid'))
      .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignUpStore.emailValid'))
          .value;
  Computed<bool>? _$passValidComputed;

  @override
  bool get passValid => (_$passValidComputed ??=
          Computed<bool>(() => super.passValid, name: '_SignUpStore.passValid'))
      .value;

  final _$formKeyAtom = Atom(name: '_SignUpStore.formKey');

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

  final _$imgFileAtom = Atom(name: '_SignUpStore.imgFile');

  @override
  File? get imgFile {
    _$imgFileAtom.reportRead();
    return super.imgFile;
  }

  @override
  set imgFile(File? value) {
    _$imgFileAtom.reportWrite(value, super.imgFile, () {
      super.imgFile = value;
    });
  }

  final _$nameAtom = Atom(name: '_SignUpStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpStore.email');

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

  final _$passAtom = Atom(name: '_SignUpStore.pass');

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

  final _$loadingAtom = Atom(name: '_SignUpStore.loading');

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

  final _$errorSignUpAtom = Atom(name: '_SignUpStore.errorSignUp');

  @override
  bool get errorSignUp {
    _$errorSignUpAtom.reportRead();
    return super.errorSignUp;
  }

  @override
  set errorSignUp(bool value) {
    _$errorSignUpAtom.reportWrite(value, super.errorSignUp, () {
      super.errorSignUp = value;
    });
  }

  final _$errorAtom = Atom(name: '_SignUpStore.error');

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

  final _$setImgFileAsyncAction = AsyncAction('_SignUpStore.setImgFile');

  @override
  Future<void> setImgFile() {
    return _$setImgFileAsyncAction.run(() => super.setImgFile());
  }

  final _$signUpAsyncAction = AsyncAction('_SignUpStore.signUp');

  @override
  Future<void> signUp(VoidCallback onSuccess, VoidCallback onFail) {
    return _$signUpAsyncAction.run(() => super.signUp(onSuccess, onFail));
  }

  final _$_SignUpStoreActionController = ActionController(name: '_SignUpStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setPass');
    try {
      return super.setPass(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
imgFile: ${imgFile},
name: ${name},
email: ${email},
pass: ${pass},
loading: ${loading},
errorSignUp: ${errorSignUp},
error: ${error},
formKeyValid: ${formKeyValid},
imgFileValid: ${imgFileValid},
nameValid: ${nameValid},
emailValid: ${emailValid},
passValid: ${passValid}
    ''';
  }
}
