import 'package:flutter/material.dart';
import 'package:mobile_app/theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget headerApp() {
      return PreferredSize(
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: false,
          title: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Image.asset(
                  "assets/logo_shop.png",
                  width: 40,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Shop Store',
                        style: primaryTextStyle.copyWith(
                            fontWeight: medium, fontSize: 14)),
                    Text('Online',
                        style: secondaryTextStyle.copyWith(
                            fontWeight: light, fontSize: 14))
                  ],
                )
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(70),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: headerApp(),
    );
  }
}
