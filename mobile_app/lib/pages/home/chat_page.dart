import 'package:flutter/material.dart';
import 'package:mobile_app/models/message_model.dart';
import 'package:mobile_app/providers/auth_provider.dart';
import 'package:mobile_app/providers/page_provider.dart';
import 'package:mobile_app/services/message_service.dart';
import 'package:mobile_app/theme.dart';
import 'package:mobile_app/widgets/chat_tile.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_headset.png',
              width: 80,
            ),
            const SizedBox(height: 20),
            Text(
              "Opps no message yet?",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  pageProvider.currentIndex = 0;
                },
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      ));
    }

    Widget content() {
      return StreamBuilder(
          stream: MessageService()
              .getMessageByUserId(userId: authProvider.user.id ?? 0),
          builder: (BuildContext context,
              AsyncSnapshot<List<MessageModel>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return emptyChat();
              } else {
                return Expanded(
                    child: Container(
                  width: double.infinity,
                  color: backgroundColor3,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    children: [
                      ChatTile(
                        key: UniqueKey(),
                        message: snapshot.data![(snapshot.data!.length - 1)],
                      ),
                    ],
                  ),
                ));
              }
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [header(), content()],
    );
  }
}
