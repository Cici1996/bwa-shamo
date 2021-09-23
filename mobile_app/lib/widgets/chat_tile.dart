import 'package:flutter/material.dart';
import 'package:mobile_app/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/logo_shop.png",
                  width: 54,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shop Store',
                        style: primaryTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        'Selamat datang d shamo store dan selamat berbelanja',
                        style: secondaryTextStyle.copyWith(fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(fontSize: 10),
                )
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
              thickness: 1,
              color: Color(0xff2b2939),
            )
          ],
        ),
      ),
    );
  }
}
