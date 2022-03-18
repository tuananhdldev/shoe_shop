import 'package:flutter/material.dart';
import 'package:shoes_shop/config/extention.dart';
import 'package:shoes_shop/data/data.dart';
import 'package:shoes_shop/pages/widgets/product_cart.dart';
import 'package:shoes_shop/pages/widgets/product_icon.dart';
import 'package:shoes_shop/themes/app_theme.dart';
import 'package:shoes_shop/themes/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [_search(context), _categoryWidget(context), _productWidget()],
    );
  }

  Widget _search(BuildContext context) {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: LightColor.lightGrey.withAlpha(100),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Products',
                  contentPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  )),
            ),
          )),
          const SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                color: Theme.of(context).backgroundColor,
                boxShadow: AppTheme.shadow),
            child: const Icon(
              Icons.filter_list,
              color: Colors.black54,
            ),
          ).ripple(() {},
              borderRadius: const BorderRadius.all(Radius.circular(13)))
        ],
      ),
    );
  }

  Widget _categoryWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map((e) => ProductIcon(
                onSelected: (model) {
                  setState(() {
                    for (var element in AppData.categoryList) {
                      element.isSelected = false;
                    }
                    model.isSelected = true;
                  });
                },
                model: e))
            .toList(),
      ),
    );
  }

  Widget _productWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: AppData.productList
            .map((e) => ProductCard(
                product: e,
                onSelected: (model) {
                  setState(() {
                    for (var element in AppData.productList) {
                      element.isSelected = false;
                    }
                  });
                  model.isSelected = true;
                }))
            .toList(),
      ),
    );
  }
}
