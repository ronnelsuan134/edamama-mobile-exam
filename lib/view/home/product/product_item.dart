import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/res/app_url.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/utils/general_utils.dart';
import 'package:ecommerce/view/product_screen.dart';
import 'package:ecommerce/view_models/add_to_cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/view_models/product_view_model.dart';

class ProductItem extends StatefulWidget {
  final Data data;

  const ProductItem({super.key, required this.data});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  AddToCartViewModel addToCartViewModel = AddToCartViewModel();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductScreen(productId: widget.data.id.toString())),
            (route) => false);
      },
      child: Card(
        color: AppColors.lightOrangeColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'https://placeimg.com/300/300/any',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 6.0,
                top: 3.0,
                right: 6.0,
                bottom: 0,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.data.title.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248),
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                      fontFamily: 'Poopins',
                    ),
                  ),
                  Text(
                    widget.data.description.toString(),
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      fontFamily: 'Poopins',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'P${widget.data.price.toString()}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Poopins',
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor,
                        ),
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.star,
                            size: 15.0,
                            color: AppColors.whiteColor,
                          ),
                          Text(
                            '4.5/5.0',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: 'Poopins',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppColors.whiteColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0))),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                       splashColor: Colors.black12.withOpacity(0.5),
                        onTap: () {
                         addToCartViewModel.fetchAddToCart(
                                  productId: widget.data.id.toString(),
                                  title: widget.data.title.toString(),
                                  qty: 1,
                                  price:widget.data.price?.toInt());
                      Utils.snackBar('Added to cart', context);
                        },
                        child: const Center(
                          child: Icon(
                            color: AppColors.whiteColor,
                            Icons.shopping_cart_outlined,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
