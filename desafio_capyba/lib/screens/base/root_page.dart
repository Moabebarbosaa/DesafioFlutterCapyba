import 'package:desafio_capyba/screens/base/base_screen.dart';
import 'package:desafio_capyba/screens/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  RootPage({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return _auth.currentUser == null ? SignInScreen() : BaseScreen();
  }
}
