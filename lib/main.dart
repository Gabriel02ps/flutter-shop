import 'package:flutter/material.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

import 'components/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        hintColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewPage(),
      routes: {AppRoutes.productDetail: (context) => const ProductDetailPage()},
    );
  }
}
