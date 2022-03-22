// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfileStore on _EditProfileStore, Store {
  Computed<bool>? _$formKeyValidComputed;

  @override
  bool get formKeyValid =>
      (_$formKeyValidComputed ??= Computed<bool>(() => super.formKeyValid,
              name: '_EditProfileStore.formKeyValid'))
          .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_EditProfileStore.nameValid'))
          .value;

  final _$formKeyAtom = Atom(name: '_EditProfileStore.formKey');

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

  final _$nameAtom = Atom(name: '_EditProfileStore.name');

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

  final _$setNameFirebaseAsyncAction =
      AsyncAction('_EditProfileStore.setNameFirebase');

  @override
  Future<void> setNameFirebase(VoidCallback onSuccess, VoidCallback onFail) {
    return _$setNameFirebaseAsyncAction
        .run(() => super.setNameFirebase(onSuccess, onFail));
  }

  final _$_EditProfileStoreActionController =
      ActionController(name: '_EditProfileStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_EditProfileStoreActionController.startAction(
        name: '_EditProfileStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EditProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
name: ${name},
formKeyValid: ${formKeyValid},
nameValid: ${nameValid}
    ''';
  }
}
