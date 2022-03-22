import 'package:desafio_capyba/common_widgets/custom_text.dart';
import 'package:desafio_capyba/screens/base/components/custom_drawer.dart';
import 'package:desafio_capyba/screens/home/home_screen.dart';
import 'package:desafio_capyba/screens/restricted/restricted_screen.dart';
import 'package:desafio_capyba/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);

  final PageStore pageStore = PageStore();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            const HomeScreen(),
            RestrictedScreen(),
          ],
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF00E963),
          title: const CustomText(text: 'CAPYBA'),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: pageStore.page,
          iconSize: 25,
          selectedFontSize: 12,
          selectedItemColor: const Color(0xFFffffff),
          onTap: (p) {
            pageController.animateToPage(p,
                duration: const Duration(milliseconds: 1), curve: Curves.easeOut);
            pageStore.page = p;
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
              backgroundColor: Color(0xFF00E963),
            ),
            BottomNavigationBarItem(
              label: 'Restrito',
              icon: Icon(Icons.lock),
              backgroundColor: Color(0xFF00E963),
            ),
          ],
        ),
      );
    });
  }
}
