import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/theme.dart';

class ChatBubble extends StatelessWidget {
  final String? textMessage;
  final bool isSender;
  final bool hasProduct;

  const ChatBubble(
      {Key? key,
      this.isSender = false,
      this.textMessage,
      this.hasProduct = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget productReview() {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        width: 230,
        decoration: BoxDecoration(
            color: isSender ? backgroundColor5 : backgroundColor4,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isSender ? 12 : 0),
                topRight: Radius.circular(isSender ? 0 : 12),
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12))),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/sample_product.png",
                    width: 70,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "COURT VISION 2.0 SHOES",
                      style: primaryTextStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$57,15',
                      style: priceTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Add to Cart",
                    style: purpleTextStyle,
                  ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(width: 8),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "Buy Now",
                      style: GoogleFonts.poppins(
                          color: backgroundColor5, fontWeight: medium),
                    ))
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productReview() : const SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      color: isSender ? backgroundColor5 : backgroundColor4,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(isSender ? 12 : 0),
                          topRight: Radius.circular(isSender ? 0 : 12),
                          bottomLeft: const Radius.circular(12),
                          bottomRight: const Radius.circular(12))),
                  child: Text(textMessage ?? "", style: primaryTextStyle),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
