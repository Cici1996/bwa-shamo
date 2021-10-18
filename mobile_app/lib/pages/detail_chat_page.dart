import 'package:flutter/material.dart';
import 'package:mobile_app/models/message_model.dart';
import 'package:mobile_app/models/product_model.dart';
import 'package:mobile_app/providers/auth_provider.dart';
import 'package:mobile_app/services/message_service.dart';
import 'package:mobile_app/theme.dart';
import 'package:mobile_app/widgets/chat_bubble.dart';
import 'package:provider/provider.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService()
          .addMessage(
              user: authProvider.user,
              isFromUser: true,
              message: messageController.text,
              product: widget.product)
          .then((value) => {
                setState(() {
                  widget.product = UnitialiazeProductModel();
                  messageController.text = "";
                })
              });
    }

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
                    widget.product.name ?? "",
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "\$${widget.product.price ?? ""}",
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UnitialiazeProductModel();
                });
              },
              child: Image.asset(
                "assets/button_close_item.png",
                width: 22,
              ),
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
            widget.product is UnitialiazeProductModel
                ? const SizedBox()
                : productReview(),
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
                      controller: messageController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Type Message....',
                          hintStyle: subTitleTextStyle),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: handleAddMessage,
                    child: Image.asset("assets/button_send.png", width: 45))
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder(
          stream: MessageService()
              .getMessageByUserId(userId: authProvider.user.id ?? 0),
          builder: (BuildContext context,
              AsyncSnapshot<List<MessageModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: snapshot.data!
                      .map((MessageModel message) => ChatBubble(
                            isSender: message.isFromuser,
                            textMessage: message.message,
                            product: message.product,
                          ))
                      .toList());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: headerApp(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
