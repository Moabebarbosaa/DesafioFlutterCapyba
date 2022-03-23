import 'package:desafio_capyba/common_widgets/custom_button.dart';
import 'package:desafio_capyba/common_widgets/custom_text.dart';
import 'package:desafio_capyba/common_widgets/custom_textformfield.dart';
import 'package:desafio_capyba/screens/base/base_screen.dart';
import 'package:desafio_capyba/store/signup_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final SignUpStore signUpStore = SignUpStore();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    void _onFail() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Falha ao criar usuário!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }

    void _onSuccess() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sucessor ao criar usuário!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => BaseScreen()));
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00E963),
        elevation: 0,
        title: const CustomText(
            text: 'Cadastro', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF00E963),
          Color(0xFF00E963),
          Color(0xFF009D42),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Observer(builder: (_) {
                return signUpStore.loading ?
                SizedBox(height: MediaQuery.of(context).size.height,child: const Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))) :
                Form(
                  key: signUpStore.formKey,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: signUpStore.setImgFile,
                        child: CircleAvatar(
                            radius: 61,
                            backgroundColor: Colors.red,
                            child: signUpStore.imgFileValid
                                ? CircleAvatar(
                                    radius: 61,
                                    backgroundImage: Image.file(
                                      signUpStore.imgFile!,
                                      fit: BoxFit.fill,
                                    ).image,
                                  )
                                : CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        CustomText(
                                          text: 'Tirar Selfie',
                                          corText: Colors.red,
                                          textAlign: TextAlign.center,
                                          fontSize: 15,
                                        ),
                                        CustomText(
                                          text: '(Obrigatório)',
                                          corText: Colors.red,
                                          textAlign: TextAlign.center,
                                          fontSize: 10,
                                        ),
                                      ],
                                    ),
                                  )),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        isPasswordType: false,
                        icon: Icons.person,
                        text: 'Nome',
                        textInputType: TextInputType.text,
                        enabled: !signUpStore.loading,
                        onChanged: signUpStore.setName,
                        validator: (String? value) => signUpStore.nameError,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        isPasswordType: false,
                        icon: Icons.email,
                        text: 'E-mail',
                        textInputType: TextInputType.emailAddress,
                        enabled: !signUpStore.loading,
                        onChanged: signUpStore.setEmail,
                        validator: (String? value) => signUpStore.emailError,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        isPasswordType: true,
                        icon: Icons.lock,
                        text: 'Senha',
                        textInputType: TextInputType.text,
                        enabled: !signUpStore.loading,
                        onChanged: signUpStore.setPass,
                        validator: (String? value) => signUpStore.passError,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                          text: 'CADASTRAR',
                          onPressed: () {
                            if (signUpStore.formKeyValid) {
                              signUpStore.signUp(_onSuccess, _onFail);
                            }
                          }),
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }
}
