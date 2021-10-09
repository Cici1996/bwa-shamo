import 'package:flutter/material.dart';
import 'package:mobile_app/models/product_model.dart';
import 'package:mobile_app/providers/wishtlist_provider.dart';
import 'package:mobile_app/theme.dart';
import 'package:provider/provider.dart';

class WishListCard extends StatelessWidget {
  final ProductModel product;
  const WishListCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishtListProvider wishtListProvider =
        Provider.of<WishtListProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor4),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/sample_product.png",
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? "",
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text(
                  "\$${product.price}",
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishtListProvider.setProduct(product);
            },
            child: Image.asset(
              "assets/button_wish_list_active.png",
              width: 34,
            ),
          )
        ],
      ),
    );
  }
}
