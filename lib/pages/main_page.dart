import 'package:flutter/material.dart';
import 'package:shoes_shop/pages/shopping_cart_page.dart';
import 'package:shoes_shop/pages/widgets/app_bar.dart';
import 'package:shoes_shop/pages/widgets/custom_bottom_navigation_bar.dart';
import 'package:shoes_shop/pages/widgets/title_text.dart';
import 'package:shoes_shop/themes/app_theme.dart';
import 'package:shoes_shop/themes/colors.dart';

import 'my_home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;

  Widget _title() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                text: isHomePageSelected ? 'Our' : 'Shopping',
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
              TitleText(
                text: isHomePageSelected ? 'Products' : 'Cart',
                fontSize: 27,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
          const Spacer(),
          !isHomePageSelected
              ? Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.delete_outline,
                    color: LightColor.orange,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Container(
            height: height,
            width: AppTheme.fullWidth(context),
            decoration:  const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xfffbfbfb), Color(0xfff7f7f7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const MyAppBar(),
                _title(),

                Expanded(
                    child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeInToLinear,
                  switchOutCurve: Curves.easeOutBack,
                  child: isHomePageSelected ? MyHomePage() : ShoppingCartPage(),
                ))
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: CustomBottomNavigationBar(
              onIconPresedCallback: onBottomIconPressed,
            ))
      ],
    ));
  }
}
