import 'package:ecommerce/models/single_product_model.dart';
import 'package:ecommerce/res/app_url.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/utils/general_utils.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view_models/add_to_cart_view_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleProduct extends StatelessWidget {
  final Data data;

  AddToCartViewModel addToCartViewModel = AddToCartViewModel();

  SingleProduct({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_sharp),
                  tooltip: 'Back',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (route) => false);
                  },
                ),
                SizedBox(
                  width: width,
                  child: Text(
                    data.title.toString(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poopins',
                      color: AppColors.lightGreenColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Text(
                    data.description.toString(),
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poopins',
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  width: width * .7,
                  child: Image.network(
                    'https://placeimg.com/300/300/any',
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              '₱ ${data.price}',
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: AppColors.orangeColor,
                              ),
                              Text(
                                '4.5/5.0',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.orangeColor,
                                  fontFamily: 'Poopins',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.favorite_outline,
                            size: 35.0,
                            color: AppColors.pink1Color,
                          ),
                          Icon(
                            Icons.share,
                            size: 35.0,
                            color: AppColors.lightGreenColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: width,
            height: 100.0,
            color: AppColors.whiteColor,
            child: Text(
              "DESCRIPTION: ${data.description.toString()}",
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poopins',
                  color: AppColors.greenColor),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
            ),
            child: Card(
              elevation: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Color(0xFFBDE7E3),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Add to Wishlist',
                      style: TextStyle(
                        fontFamily: 'Poopins',
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.blackColor,
                      ),
                      onPressed: () {
                        addToCartViewModel.fetchAddToCart(
                          productId: data.id.toString(),
                          title: data.title.toString(),
                          qty: 1,
                          price: data.price?.toInt(),
                        );
                      Utils.snackBar('Added to cart', context);
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontFamily: 'Poopins',
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Utils.snackBar('Added to cart', context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightGreenColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                          fontFamily: 'Poopins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
