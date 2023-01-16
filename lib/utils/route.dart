import 'package:ecommerce/utils/routes_name.dart';
import 'package:ecommerce/view/cart_screen.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view/product_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      // case RoutesName.productScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const ProductScreen());

      case RoutesName.cartScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CartScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Routed Defined'),
            ),
          );
        });
    }
  }
}
