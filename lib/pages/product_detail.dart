import 'package:flutter/material.dart';
import 'package:shoes_shop/config/extention.dart';
import 'package:shoes_shop/data/data.dart';
import 'package:shoes_shop/gen/assets.gen.dart';
import 'package:shoes_shop/pages/widgets/title_text.dart';
import 'package:shoes_shop/themes/app_theme.dart';
import 'package:shoes_shop/themes/colors.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLiked = true;

  Widget _icon(
    IconData icon, {
    Color color = LightColor.iconColor,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function? onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          border: Border.all(
              color: LightColor.iconColor,
              style: isOutLine ? BorderStyle.solid : BorderStyle.none),
          color: isOutLine
              ? Colors.transparent
              : Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          boxShadow: const [
            BoxShadow(
                color: Color(0xfff8f8f8),
                blurRadius: 5,
                spreadRadius: 10,
                offset: Offset(5, 5)),
          ]),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: const BorderRadius.all(Radius.circular(13)));
  }

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _icon(Icons.arrow_back_ios,
              color: Colors.black54,
              size: 15,
              padding: 12,
              isOutLine: true, onPressed: () {
            Navigator.pop(context);
          }),
          _icon(isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? LightColor.red : LightColor.lightGrey,
              size: 15,
              padding: 12,
              isOutLine: false, onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          })
        ],
      ),
    );
  }

  Widget _productImage() {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return AnimatedOpacity(
          opacity: animation.value,
          duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const TitleText(
            text: "AIP",
            fontSize: 160,
            color: LightColor.lightGrey,
          ),
          Image.asset(Assets.images.show1.path)
        ],
      ),
    );
  }

  Widget _categoryWiget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: AppData.showThumbnailList.map((e) => _thumbnail(e)).toList(),
      ),
    );
  }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return AnimatedOpacity(
          opacity: animation.value,
          duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: LightColor.grey),
            borderRadius: const BorderRadius.all(Radius.circular(13)),
          ),
          child: Image.asset(image),
        ).ripple(() {},
            borderRadius: const BorderRadius.all(Radius.circular(13))),
      ),
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _sizeWidget("US 6"),
            _sizeWidget("US 7", isSelected: true),
            _sizeWidget('US 8'),
            _sizeWidget('US 9'),
          ],
        )
      ],
    );
  }

  Widget _sizeWidget(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.red : LightColor.iconColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          color: isSelected
              ? LightColor.orange
              : Theme.of(context).backgroundColor),
      child: TitleText(
        text: text,
        fontSize: 16,
        color: isSelected ? LightColor.background : LightColor.titleTextColor,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.circular(13));
  }

  Widget _availableColors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          text: 'Available Colors',
          fontSize: 14,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _colorWidget(LightColor.yellowColor, iSelected: true),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.lightBlue),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.black),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.red),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.skyBlue),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(Color color, {bool iSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: iSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(
              radius: 7,
              backgroundColor: color,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: LightColor.orange,
        child: Icon(
          Icons.shopping_basket,
          color: Theme.of(context).floatingActionButtonTheme.foregroundColor,
        ),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(8),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xfffbfbfb),
          Color(0xfff7f7f7),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            Column(
              children: [
                _appBar(),
                _productImage(),
                _categoryWiget(),
              ],
            ),
            _detailWidget()
          ],
        ),
      )),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        SizedBox(height: 20),
        Text(AppData.description),
      ],
    );
  }

  Widget _detailWidget() {
    return DraggableScrollableSheet(
      maxChildSize: 0.8,
      initialChildSize: 0.53,
      minChildSize: 0.53,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                          color: LightColor.iconColor.withAlpha(100),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _titleWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  _availableSize(),
                  const SizedBox(
                    height: 20,
                  ),
                  _availableColors(),
                  const SizedBox(
                    height: 20,
                  ),
                  _description()
                ]),
          ),
        );
      },
    );
  }

  Container _titleWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TitleText(
            text: "NIKE AIR MAX 200",
            fontSize: 25,
            color: Colors.black54,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //title
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  TitleText(
                    text: '\$',
                    fontSize: 18,
                    color: LightColor.red,
                  ),
                  TitleText(
                    text: '240',
                    fontSize: 25,
                  )
                ],
              ),
              //stars
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: LightColor.yellowColor,
                    size: 17,
                  ),
                  Icon(
                    Icons.star,
                    color: LightColor.yellowColor,
                    size: 17,
                  ),
                  Icon(
                    Icons.star,
                    color: LightColor.yellowColor,
                    size: 17,
                  ),
                  Icon(
                    Icons.star,
                    color: LightColor.yellowColor,
                    size: 17,
                  ),
                  Icon(
                    Icons.star_border,
                    size: 17,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
