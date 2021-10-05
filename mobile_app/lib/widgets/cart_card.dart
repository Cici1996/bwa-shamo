import 'package:flutter/material.dart';
import 'package:mobile_app/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      image: AssetImage("assets/sample_product.png"))),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Terrex Urban Low",
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text(
                  "\$143,98",
                  style: priceTextStyle,
                )
              ],
            )),
            Column(
              children: [
                Image.asset(
                  "assets/button_add_item.png",
                  width: 16,
                ),
                const SizedBox(height: 2),
                Text("2", style: primaryTextStyle.copyWith(fontWeight: medium)),
                const SizedBox(height: 2),
                Image.asset(
                  "assets/button_reduce_item.png",
                  width: 16,
                )
              ],
            )
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Icon(
              Icons.delete,
              color: alertColor,
              size: 14,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Remove",
              style: alertTextStyle.copyWith(fontSize: 12, fontWeight: light),
            )
          ])
        ],
      ),
    );
  }
}
