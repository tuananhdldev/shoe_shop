import 'package:flutter/material.dart';
import 'package:shoes_shop/config/extention.dart';
import 'package:shoes_shop/data/data.dart';
import 'package:shoes_shop/pages/widgets/title_text.dart';
import 'package:shoes_shop/themes/colors.dart';

class ProductIcon extends StatelessWidget {
  const ProductIcon({Key? key, required this.onSelected, required this.model})
      : super(key: key);
  final ValueChanged<Category> onSelected;
  final Category model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(13)),
                  color: model.isSelected
                      ? LightColor.background
                      : Colors.transparent,
                  border:
                      Border.all(
                          color: model.isSelected
                              ? LightColor.orange
                              : LightColor.grey,
                          width: model.isSelected ? 2 : 1),
                  boxShadow: [
                    BoxShadow(
                      color: model.isSelected
                          ? const Color(0xfffbf2ef)
                          : Colors.white,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: const Offset(5, 5),
                    )
                  ]),
              child: Row(
                children: [
                  Image.asset(model.image),
                  TitleText(
                    text: model.name,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ))
          .ripple(() => onSelected(model),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}
