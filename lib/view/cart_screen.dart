import 'package:ecommerce/data/response/status.dart';
import 'package:ecommerce/res/app_url.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/view/cart/cart_list.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/view/layout/app_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartViewModel cartViewModel = CartViewModel();

    @override
  void initState() {
    cartViewModel.fetchCartItemList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppUrl.logoUrl,
              width: 100,
              height: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 125.0,
              height: 25.0,
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.lightGreenColor)),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 0),
                    hintText: 'Search here',
                    hintStyle: TextStyle(fontSize: 12.0)),
              ),
            ),
            Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                  color: AppColors.lightGreenColor,
                  border: Border.all(
                    color: AppColors.whiteColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0))),
              child: InkWell(
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 20.0,
                ),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
      body:ChangeNotifierProvider<CartViewModel>(
        create: (BuildContext context) => cartViewModel,
        child: Consumer<CartViewModel>(builder: (context, value, _) {
          switch (value.cartList.status) {
            case Status.LOADING:
              return SizedBox(
                height: height,
                child: const Center(child: CircularProgressIndicator()),
              );
            case Status.ERROR:
              return SizedBox(
                  width: width * .5, child: Text(value.cartList.toString()));
            case Status.COMPLETED:
              return SingleChildScrollView(
                child: _cartItemList(value),
              );
            default:
              return const Text("test");
          }
        }),
      ),
      bottomNavigationBar:BottomAppBar(
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
              },
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

  CartList _cartItemList(CartViewModel value) => CartList(data:value.cartList.data!.data!);
}
