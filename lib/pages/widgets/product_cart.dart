import 'package:flutter/material.dart';
import 'package:shoes_shop/config/extention.dart';
import 'package:shoes_shop/data/data.dart';
import 'package:shoes_shop/pages/widgets/title_text.dart';
import 'package:shoes_shop/themes/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.onSelected})
      : super(key: key);
  final Product product;
  final ValueChanged<Product> onSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
      decoration: const BoxDecoration(
          color: LightColor.background,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10)
          ]),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    product.isliked ? Icons.favorite : Icons.favorite_border,
                    color:
                        product.isliked ? LightColor.red : LightColor.iconColor,
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: product.isSelected ? 15 : 0,
                ),
                Expanded(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: LightColor.orange.withAlpha(40),
                    ),
                    Image.asset(product.image)
                  ],
                )),
                TitleText(
                  text: product.name,
                  fontSize: product.isSelected ? 16 : 14,
                ),
                TitleText(
                  text: product.category,
                  fontSize: product.isSelected ? 14 : 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: product.price.toString(),
                  fontSize: product.isSelected ? 18 : 16,
                ),
              ],
            )
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(product);
      }, borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}
