import 'package:desafio_capyba/common_widgets/custom_text.dart';
import 'package:desafio_capyba/screens/editprofile/edit_profile.dart';
import 'package:desafio_capyba/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final UserManagerStore userManager = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFffffff),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF00E963),
            ),
            accountEmail: CustomText(
                 text: userManager.user?.email ?? '',
            ),
            accountName: CustomText(
              text: userManager.user?.name ?? '',
            ),
            currentAccountPicture: Container(
              width: 300.0,
              height: 500.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage(
                        userManager.user?.img ?? 'https://elegatestore.com/wp-content/uploads/2020/11/perfil-blog.png',
                      ), fit: BoxFit.cover)
              ),
            ),
          ),

          ListTile(
              leading: const Icon(Icons.person),
              title: const CustomText(text: "Meu Perfil"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              }),
          ListTile(
              leading: const Icon(Icons.verified),
              title: const Text("Validar Email"),
              onTap: () {
                debugPrint('toquei no drawer');
              }),
        ],
      ),
    );
  }
}
