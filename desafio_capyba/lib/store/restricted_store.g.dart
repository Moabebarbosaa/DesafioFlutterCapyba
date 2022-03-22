// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restricted_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestrictedStore on _RestrictedStore, Store {
  Computed<String>? _$pageIsValidComputed;

  @override
  String get pageIsValid =>
      (_$pageIsValidComputed ??= Computed<String>(() => super.pageIsValid,
              name: '_RestrictedStore.pageIsValid'))
          .value;

  final _$validAtom = Atom(name: '_RestrictedStore.valid');

  @override
  bool get valid {
    _$validAtom.reportRead();
    return super.valid;
  }

  @override
  set valid(bool value) {
    _$validAtom.reportWrite(value, super.valid, () {
      super.valid = value;
    });
  }

  final _$_RestrictedStoreActionController =
      ActionController(name: '_RestrictedStore');

  @override
  void setValid(bool value) {
    final _$actionInfo = _$_RestrictedStoreActionController.startAction(
        name: '_RestrictedStore.setValid');
    try {
      return super.setValid(value);
    } finally {
      _$_RestrictedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valid: ${valid},
pageIsValid: ${pageIsValid}
    ''';
  }
}
