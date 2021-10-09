import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/product_model.dart';
import 'package:mobile_app/providers/cart_provider.dart';
import 'package:mobile_app/providers/wishtlist_provider.dart';
import 'package:mobile_app/theme.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List familiarShoes = [
    "assets/sample_product.png",
    "assets/sample_product.png",
    "assets/sample_product.png",
    "assets/sample_product.png",
    "assets/sample_product.png",
    "assets/sample_product.png",
    "assets/sample_product.png",
    "assets/sample_product.png"
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishtListProvider wishtListProvider =
        Provider.of<WishtListProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<dynamic> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => SizedBox(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: backgroundColor3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/icon_success.png",
                          width: 100,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Hurray :)",
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Item added successfully",
                          style: secondaryTextStyle,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 154,
                          height: 44,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                            child: Text(
                              "View My Cart",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget indicatorSlider(int index) {
      return Container(
          width: currentIndex == index ? 16 : 4,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentIndex == index
                  ? primaryColor
                  : const Color(0xffc4c4c4)));
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.chevron_left)),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
              items: widget.product.galleries
                  ?.map((path) => Image.asset(
                        "assets/sample_product.png",
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries!.map((path) {
              index++;
              return indicatorSlider(index);
            }).toList(),
          )
        ],
      );
    }

    Widget familiarShoesCard(String pathImage) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(pathImage)),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget content() {
      int indexFamiliarShoes = 0;

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            color: backgroundColor1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name ?? "",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        widget.product.category?.name ?? "",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  )),
                  GestureDetector(
                    onTap: () {
                      wishtListProvider.setProduct(widget.product);
                      if (wishtListProvider.isWishList(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: secondaryColor,
                            content: const Text(
                              "Has been added to the Wishlist",
                              textAlign: TextAlign.center,
                            )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: alertColor,
                            content: const Text(
                              "Has been removed from the Wishlist",
                              textAlign: TextAlign.center,
                            )));
                      }
                    },
                    child: Image.asset(
                      wishtListProvider.isWishList(widget.product)
                          ? "assets/button_wish_list_active.png"
                          : "assets/button_wish_list.png",
                      width: 46,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: backgroundColor2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price starts from",
                    style: primaryTextStyle,
                  ),
                  Text(
                    "\$${widget.product.price}",
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(widget.product.description ?? "",
                      style: subTitleTextStyle.copyWith(fontWeight: light),
                      textAlign: TextAlign.justify)
                ],
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                        "Familiar Shoes",
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: familiarShoes.map((e) {
                        indexFamiliarShoes++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: indexFamiliarShoes == 1
                                    ? defaultMargin
                                    : 0),
                            child: familiarShoesCard(e));
                      }).toList()),
                    )
                  ],
                )),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/detail-chat");
                    },
                    child: Container(
                      height: 54,
                      width: 54,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/button_chat.png"))),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: primaryColor),
                        child: Text(
                          "Add to Cart",
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: shoesColor,
        body: Center(
          child: ListView(
            children: [header(), content()],
          ),
        ));
  }
}
