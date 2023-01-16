import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/utils/general_utils.dart';
import 'package:ecommerce/view_models/add_to_cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/view/product_screen.dart';

class FeatureProductItem extends StatefulWidget {
  final Data results;

  // ignore: prefer_const_constructors_in_immutables
  FeatureProductItem({super.key, required this.results});

  @override
  State<FeatureProductItem> createState() => _FeatureProductItemState();
}

class _FeatureProductItemState extends State<FeatureProductItem> {
  AddToCartViewModel addToCartViewModel = AddToCartViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductScreen(productId: widget.results.id.toString())),
            (route) => false);
      },
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
            ),
            width: 120.0,
            height: 280.0,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: const Image(
                        image:
                            NetworkImage("https://placeimg.com/300/300/any")),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.results.title.toString(),
                        style: const TextStyle(
                            fontFamily: 'Poopins',
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.0),
                      ),
                      Text(
                        widget.results.description.toString(),
                        style: const TextStyle(
                            fontFamily: 'Poopins',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'P' + widget.results.price.toString(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Poopins',
                            fontWeight: FontWeight.w500,
                            color: AppColors.greenDarkColor,
                          ),
                        ),
                        Row(
                          children: const <Widget>[
                            Icon(
                              Icons.star,
                              size: 15.0,
                              color: AppColors.orangeColor,
                            ),
                            Text(
                              '4.5/5.0',
                              style: TextStyle(
                                color: AppColors.orangeColor,
                                fontFamily: 'Poopins',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Flexible(
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppColors.lightGreenColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2.0))),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              addToCartViewModel.fetchAddToCart(
                                  productId: widget.results.id.toString(),
                                  title: widget.results.title.toString(),
                                  qty: 1,
                                  price: widget.results.price?.toInt());
                                  Utils.snackBar('Added to cart', context);
                            },
                            child: const Center(
                              child: Icon(
                                color: AppColors.lightGreenColor,
                                Icons.shopping_cart_outlined,
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
