import 'package:desafio_capyba/common_widgets/custom_text.dart';
import 'package:desafio_capyba/store/restricted_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RestrictedScreen extends StatelessWidget {
  RestrictedScreen({Key? key}) : super(key: key);

  final RestrictedStore restrictedStore = RestrictedStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Container(
        color: Colors.green,
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
