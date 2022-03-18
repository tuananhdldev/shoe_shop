import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop/config/route.dart';
import 'package:shoes_shop/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: AppTheme.lightTheme.copyWith(
          textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme)),
      routes: Routes.getRoute(),
    );
  }
}
