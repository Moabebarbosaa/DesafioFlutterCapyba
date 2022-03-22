import 'package:desafio_capyba/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
          child: CustomText(
            text: 'LIBERADO!',
            corText: Colors.white,
            fontSize: 25,
          ),
      ),
    );
  }
}
