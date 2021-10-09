import 'package:flutter/material.dart';
import 'package:mobile_app/providers/wishtlist_provider.dart';
import 'package:mobile_app/theme.dart';
import 'package:mobile_app/widgets/wishlist_card.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishtListProvider wishtListProvider =
        Provider.of<WishtListProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: const Text("Favorite Shoes"),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyList() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon_love1.png",
              width: 74,
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              "You don't have dream shoes?",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Text(
              "Let's find your favorite shoes",
              style: secondaryTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Explore Store",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 24)),
                ))
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: backgroundColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: wishtListProvider.wishList
              .map((e) => WishListCard(
                    key: UniqueKey(),
                    product: e,
                  ))
              .toList(),
        ),
      ));
    }

    return Column(
      children: [
        header(),
        wishtListProvider.wishList.isEmpty ? emptyList() : content()
      ],
    );
  }
}
