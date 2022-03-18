import 'package:flutter/material.dart';
import 'package:shoes_shop/config/extention.dart';
import 'package:shoes_shop/data/data.dart';
import 'package:shoes_shop/pages/widgets/title_text.dart';
import 'package:shoes_shop/themes/app_theme.dart';
import 'package:shoes_shop/themes/colors.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: Column(children: [
          _cartItems(),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: LightColor.iconColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(
                text: '${AppData.cartList.length} Items',
                color: LightColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              TitleText(text: '\$${getPrice()}', fontSize: 18,),

            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _submitButton(context)
        ]),
      ),
    );
  }
  Widget _submitButton(BuildContext context){
    return  Container(

      alignment:  Alignment.center,

      decoration: BoxDecoration(color: LightColor.orange, borderRadius: BorderRadius.circular(10) ),
      padding:  const EdgeInsets.symmetric(vertical: 15),
      width: AppTheme.fullWidth(context)*0.75,
      child:  const TitleText(text: 'Next', color: LightColor.background, fontWeight: FontWeight.w500,),
    ).ripple((){}, borderRadius: BorderRadius.circular(10))
    ;
  }
  double getPrice(){
    double price =0;
    for (var x in AppData.cartList) {price +=  x.price* x.id;}
    return price;
  }

  Widget _cartItems() => Column(
        children: AppData.cartList.map((e) => _item(e)).toList(),
      );

  Widget _item(Product model) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          //IMAGE
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: LightColor.lightGrey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Positioned(
                    left: -20, bottom: -20, child: Image.asset(model.image))
              ],
            ),
          ),
          Expanded(
              child: ListTile(
            title: TitleText(
              text: model.name,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            subtitle: Row(
              children: [
                const TitleText(
                  text: '\$',
                  color: LightColor.red,
                  fontSize: 12,
                ),
                TitleText(
                  text: model.price.toString(),
                  color: LightColor.red,
                  fontSize: 14,
                ),
              ],
            ),
            trailing: Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(150),
                  borderRadius: BorderRadius.circular(10)),
              child: TitleText(
                text: 'x${model.id}',
                fontSize: 12,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
