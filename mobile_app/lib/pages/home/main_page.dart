import 'package:flutter/material.dart';
import 'package:mobile_app/pages/home/chat_page.dart';
import 'package:mobile_app/pages/home/home_page.dart';
import 'package:mobile_app/pages/home/profile_page.dart';
import 'package:mobile_app/pages/home/wishlist_page.dart';
import 'package:mobile_app/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_shop.png',
          width: 20,
        ),
      );
    }

    Widget bodyContent() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    Widget costumeButtomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor4,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_home.png',
                        width: 21,
                        color:
                            currentIndex == 0 ? primaryColor : basicGrayColor,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_chat.png',
                        width: 20,
                        color:
                            currentIndex == 1 ? primaryColor : basicGrayColor,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_love.png',
                        width: 20,
                        color:
                            currentIndex == 2 ? primaryColor : basicGrayColor,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_user.png',
                        width: 18,
                        color:
                            currentIndex == 3 ? primaryColor : basicGrayColor,
                      ),
                    ),
                    label: "")
              ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: costumeButtomNav(),
      body: bodyContent(),
    );
  }
}
