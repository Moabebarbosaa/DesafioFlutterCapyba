import 'package:desafio_capyba/common_widgets/custom_button.dart';
import 'package:desafio_capyba/common_widgets/custom_text.dart';
import 'package:desafio_capyba/common_widgets/custom_textformfield.dart';
import 'package:desafio_capyba/screens/base/base_screen.dart';
import 'package:desafio_capyba/screens/signup/signup_screen.dart';
import 'package:desafio_capyba/store/signin_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final SignInStore signInStore = SignInStore();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    void _onFail() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Falha no login!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }

    void _onSuccess() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => BaseScreen()));
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00E963),
              Color(0xFF00E963),
              Color(0xFF009D42),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
            child: Observer(builder: (_){
              return Form(
                key: signInStore.formKey,
                child: Column(
                  children: [
                    Image.asset(
                      'images/capyba_logo.png',
                      fit: BoxFit.fitWidth,
                      width: 240,
                      height: 240,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      isPasswordType: false,
                      icon: Icons.email,
                      text: 'E-mail',
                      textInputType: TextInputType.emailAddress,
                      onChanged: signInStore.setEmail,
                      enabled: !signInStore.loading,
                      validator: (String? value) => signInStore.emailError,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      isPasswordType: false,
                      icon: Icons.lock,
                      text: 'Senha',
                      textInputType: TextInputType.emailAddress,
                      onChanged: signInStore.setPass,
                      enabled: !signInStore.loading,
                      validator: (String? value) => signInStore.passError,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: (){
                        if (signInStore.formKeyValid) {
                          signInStore.signIn(_onSuccess, _onFail);
                        }
                      },
                      text: 'ENTRAR',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(text: 'Não tem conta?', corText: Colors.white70),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUpScreen()));
                          },
                          child: const CustomText(
                            text: ' Cadastre-se',
                            corText: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            })
          ),
        ),
      )
    );
  }
}
