import 'package:flutter/cupertino.dart';
import 'package:shoes_shop/pages/product_detail.dart';

import '../pages/main_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const MainPage(),
      '/detail': (_) => const ProductDetailPage()
    };
  }
}
