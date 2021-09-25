import 'package:flutter/material.dart';
import 'package:mobile_app/theme.dart';
import 'package:mobile_app/widgets/chat_bubble.dart';

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

    Widget productReview() {
      return Container(
        width: 225,
        height: 74,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/sample_product.png",
                width: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Predator 20.3',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "\$57,15",
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/button_close_item.png",
              width: 22,
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productReview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: backgroundColor4,
                        borderRadius: BorderRadius.circular(12)),
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'Typle Message....',
                          hintStyle: subTitleTextStyle),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Image.asset("assets/button_send.png", width: 45)
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
            key: UniqueKey(),
            isSender: true,
            textMessage: 'Hi, This item is still available?',
            hasProduct: true,
          ),
          ChatBubble(
            key: UniqueKey(),
            isSender: false,
            textMessage:
                'Good night, This item is only available in size 42 and 43',
          ),
          ChatBubble(
            key: UniqueKey(),
            isSender: true,
            textMessage: 'Owww, it suits me very well',
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: headerApp(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
