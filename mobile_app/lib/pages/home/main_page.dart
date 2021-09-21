import 'package:flutter/material.dart';
import 'package:mobile_app/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_shop.png',
          width: 20,
        ),
      );
    }

    Widget costumeButtomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor4,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icon_home.png',
                      width: 21,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icon_chat.png',
                      width: 20,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icon_love.png',
                      width: 20,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icon_user.png',
                      width: 18,
                    ),
                    label: "")
              ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: costumeButtomNav(),
      body: const Center(child: Text('home Page')),
    );
  }
}
