import 'package:ecommerce/view/cart_screen.dart';
import 'package:ecommerce/view/layout/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/res/constant/string_const.dart';
import 'package:ecommerce/res/app_url.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/view/home/banner/banner.dart';
import 'package:ecommerce/view/home/categories/categories.dart';
import 'package:ecommerce/view/home/product/featured_product_list.dart';
import 'package:ecommerce/view/home/product/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(backgroundColor: AppColors.whiteColor),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.lightGreenColor,
          ),
          child: Column(
            children: const <Widget>[
              BannerSection(),
              CategoriesSection(),
              FeaturedProductList(),
              ProductList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color:AppColors.lightGreenColor,
        shape: const CircularNotchedRectangle(),
        elevation: 3.0,
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              color: AppColors.whiteColor,
              icon: const Icon(Icons.shop_outlined),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false);
              }
            ),
            IconButton(
              color: AppColors.whiteColor,
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                    (route) => false);
              },
            ),
            IconButton(
              color: AppColors.whiteColor,
              icon: const Icon(Icons.supervisor_account),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


//  Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                      ),
//                   (route) => false);

//  Container(
//         
//         ),
//         child: ClipRRect(
//           
//           child: BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.shop),
//                 label: 'Shop',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.shopping_cart),
//                 label: 'Cart',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.supervisor_account),
//                 label: 'My Profile',
//               ),
//             ],
          
//           ),
//         ),
//       ),