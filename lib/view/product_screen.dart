import 'package:ecommerce/data/response/status.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/res/app_url.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/view/cart_screen.dart';
import 'package:ecommerce/view/product/single_product.dart';
import 'package:ecommerce/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/view/layout/app_bar.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final String productId;
  
  const ProductScreen({super.key,required this.productId});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductViewModel productViewModel = ProductViewModel();
  @override
  void initState() {
    productViewModel.fetchSingleProduct(widget.productId);
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
                onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()),
                        (route) => false);
                },
              ),
            )
          ],
        ),
      ),
      body: ChangeNotifierProvider<ProductViewModel>(
        create: (BuildContext context) => productViewModel,
        child: Consumer<ProductViewModel>(builder: (context, value, _) {
          switch (value.product.status) {
            case Status.LOADING:
              return SizedBox(
                height: height,
                child: const Center(child: CircularProgressIndicator()),
              );
            case Status.ERROR:
              return SizedBox(
                  width: width * .5, child: Text(value.product.toString()));
            case Status.COMPLETED:
              return SingleChildScrollView(
                child: _singleProduct(value),
              );
            default:
              return const Text("test");
          }
        }),
      ),
  
    );
  }

  SingleProduct _singleProduct(ProductViewModel value) => SingleProduct(data: value.product.data!.data!);
}
