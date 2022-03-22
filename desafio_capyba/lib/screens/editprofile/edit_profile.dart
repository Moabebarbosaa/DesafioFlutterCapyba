import 'package:desafio_capyba/common_widgets/custom_button.dart';
import 'package:desafio_capyba/common_widgets/custom_text.dart';
import 'package:desafio_capyba/common_widgets/custom_textformfield.dart';
import 'package:desafio_capyba/store/edit_profile_store.dart';
import 'package:desafio_capyba/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final EditProfileStore editProfileStore = EditProfileStore();
  final UserManagerStore pageStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {

    void _onFail() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao salvar nome!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }

    void _onSuccess() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nome salvo com sucesso!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => BaseScreen()));
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const CustomText(text: 'Meu Perfil',),
          centerTitle: true,
          backgroundColor: const Color(0xFF00E963),
          elevation: 0,
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
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const CustomText(
                        text: 'Alterar Nome:',
                      corText: Colors.white,
                      fontSize: 20,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (String? value) => editProfileStore.nameError,
                      onChanged: editProfileStore.setName,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.drive_file_rename_outline, color: Colors.white),
                          labelText: pageStore.user?.name,
                          labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none)
                          )
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(onPressed: (){
                      if (editProfileStore.name.isEmpty) {
                        _onFail();
                      } else {
                        editProfileStore.setNameFirebase(_onSuccess, _onFail);
                      }
                    },
                    text: 'SALVAR')
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
