import 'dart:async';

import 'package:desafio_capyba/common_widgets/custom_text.dart';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/store/restricted_store.dart';
import 'package:desafio_capyba/store/user_manager_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class RestrictedScreen extends StatefulWidget {
  const RestrictedScreen({Key? key}) : super(key: key);

  @override
  State<RestrictedScreen> createState() => _RestrictedScreenState();
}

class _RestrictedScreenState extends State<RestrictedScreen> {
  final RestrictedStore restrictedStore = RestrictedStore();

  final UserManagerStore userManager = GetIt.I<UserManagerStore>();

  Timer? timer;
  bool isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      timer = Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {

    }
  }

  Future checkEmailVerified() async {

    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      final user = FirebaseAuth.instance.currentUser;
      userManager.setUser(
          UserModel(
              id: user?.uid,
              img: user?.photoURL,
              name: user?.displayName,
              email: user?.email,
              emailVerified: isEmailVerified));
    });

    if (isEmailVerified) timer?.cancel();
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Container(
        color: isEmailVerified ? Colors.green : Colors.red,
        child: Center(
          child: CustomText(
            text: restrictedStore.pageIsValid,
            corText: Colors.white,
            fontSize: 25,
          ),
        ),
      );
    });
  }
}
