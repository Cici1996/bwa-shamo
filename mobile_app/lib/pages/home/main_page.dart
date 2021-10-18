import 'package:flutter/material.dart';
import 'package:mobile_app/pages/home/chat_page.dart';
import 'package:mobile_app/pages/home/home_page.dart';
import 'package:mobile_app/pages/home/profile_page.dart';
import 'package:mobile_app/pages/home/wishlist_page.dart';
import 'package:mobile_app/providers/page_provider.dart';
import 'package:mobile_app/theme.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
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
      switch (pageProvider.currentIndex) {
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
              currentIndex: pageProvider.currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor4,
              onTap: (value) {
                pageProvider.currentIndex = value;
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_home.png',
                        width: 21,
                        color: pageProvider.currentIndex == 0
                            ? primaryColor
                            : basicGrayColor,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_chat.png',
                        width: 20,
                        color: pageProvider.currentIndex == 1
                            ? primaryColor
                            : basicGrayColor,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_love.png',
                        width: 20,
                        color: pageProvider.currentIndex == 2
                            ? primaryColor
                            : basicGrayColor,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_user.png',
                        width: 18,
                        color: pageProvider.currentIndex == 3
                            ? primaryColor
                            : basicGrayColor,
                      ),
                    ),
                    label: "")
              ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: costumeButtomNav(),
      body: bodyContent(),
    );
  }
}
