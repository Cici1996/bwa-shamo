import 'package:flutter/material.dart';
import 'package:mobile_app/models/cart_model.dart';
import 'package:mobile_app/providers/cart_provider.dart';
import 'package:mobile_app/theme.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  const CartCard({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
                  cart.product?.name ?? "",
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text(
                  "\$${cart.product?.price ?? ""}",
                  style: priceTextStyle,
                )
              ],
            )),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    cartProvider.addQuantity(cart.id ?? -1);
                  },
                  child: Image.asset(
                    "assets/button_add_item.png",
                    width: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium)),
                const SizedBox(height: 2),
                GestureDetector(
                  onTap: () {
                    cartProvider.reduceQuantity(cart.id ?? -1);
                  },
                  child: Image.asset(
                    "assets/button_reduce_item.png",
                    width: 16,
                  ),
                )
              ],
            )
          ]),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id ?? -1);
            },
            child: Row(children: [
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
            ]),
          )
        ],
      ),
    );
  }
}
