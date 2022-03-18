import 'package:shoes_shop/gen/assets.gen.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/images/shooe_tilt_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 220.00,
        isliked: true,
        image: 'assets/images/shoe_tilt_2.png',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/images/small_tilt_shoe_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 190.00,
        isliked: false,
        image: 'assets/images/small_tilt_shoe_2.png',
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'Nike Air Max 92607',
        price: 220.00,
        isliked: false,
        image: 'assets/images/small_tilt_shoe_3.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        // image: 'assets/images/small_tilt_shoe_1.png',
        image: Assets.images.smallTiltShoe1.path,
        category: "Trending Now"),
    // Product(
    //     id:1,
    //     name: 'Nike Air Max 97',
    //     price: 190.00,
    //     isliked: false,
    //     image: 'assets/small_tilt_shoe_2.png',
    //     category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(
        id: 1,
        name: "Sneakers",
        image: Assets.images.shoeThumb2.path,
        isSelected: true),
    Category(id: 2, name: "Jacket", image: 'assets/images/jacket.png'),
    Category(id: 3, name: "Watch", image: 'assets/images/watch.png'),
    Category(id: 4, name: "Watch", image: 'assets/images/watch.png'),
  ];
  static List<String> showThumbnailList = [
    "assets/images/shoe_thumb_5.png",
    "assets/images/shoe_thumb_1.png",
    "assets/images/shoe_thumb_4.png",
    "assets/images/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}

class Product {
  int id;
  String name;
  String category;
  String image;
  double price;
  bool isliked;
  bool isSelected;

  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.isliked,
      this.isSelected = false,
      required this.image});
}

class Category {
  int id;
  String name;
  String image;
  bool isSelected;
  Category(
      {required this.id,
      required this.name,
      this.isSelected = false,
      required this.image});
}
