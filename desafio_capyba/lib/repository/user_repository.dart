import 'dart:io';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class UserRepository {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _firestore = FirebaseStorage.instance;

  Future<UserModel> signUp(UserModel user, File imgFile) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: user.email!,
          password: user.pass!);

      String ref = 'users/${result.user?.uid}.jpg';
      await _firestore.ref(ref).putFile(imgFile);

      result.user?.updatePhotoURL(await _firestore.ref(ref).getDownloadURL());
      result.user?.updateDisplayName(user.name);

      await result.user?.reload();

      final updateResult = _auth.currentUser;

      return mapFirebaseToUser(updateResult!);
    } on FirebaseAuthException catch (e) {
      print('UserRepository.signUp | $e');
      return Future.error(e.code);
    }
  }

  Future<UserModel> updateName(String name) async {
    try {
      User? userFirebase =  _auth.currentUser;

      await userFirebase?.updateDisplayName(name);
      await userFirebase?.reload();

      User? updateUserFirebase =  _auth.currentUser;
      return mapFirebaseToUser(updateUserFirebase!);

      } on FirebaseAuthException catch (e) {
      print('UserRepository.updateName | $e');
      return Future.error(e.code);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      User? userFirebase =  _auth.currentUser;
      await userFirebase?.sendEmailVerification();

    } on FirebaseAuthException catch (e) {
      print('UserRepository.updateName | $e');
      return Future.error(e.code);
    }
  }

  Future<UserModel> signIn(UserModel user) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: user.email!, password: user.pass!);
      return mapFirebaseToUser(result.user!);
    } on PlatformException catch (e){
      print('UserRepository.signIn | $e');
      return Future.error(e.code);
    }
  }

  Future<UserModel> fetchCurrentUser() async {
    return mapFirebaseToUser(_auth.currentUser!);
  }

  UserModel mapFirebaseToUser(User firebaseUser) {
    return UserModel(
      name: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
      id: firebaseUser.uid,
      img: firebaseUser.photoURL ?? '',
      emailVerified: firebaseUser.emailVerified,
    );
  }
}
