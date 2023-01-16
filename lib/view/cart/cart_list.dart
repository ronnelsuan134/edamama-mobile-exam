import 'package:ecommerce/models/get_cart.dart';
import 'package:ecommerce/res/app_url.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final Data data;
  const CartList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * .8,
      padding: const EdgeInsets.all(15.0),
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false);
              },
              icon: const Icon(Icons.arrow_back)),
          const Text(
            'Cart',
            style: TextStyle(
              fontFamily: 'Poopins',
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
          Expanded(
            child: _CartItemsAvailable(height: height, data: data),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              color: AppColors.blackColor,
              thickness: 1.0,
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontFamily: 'Poopins',
                      fontSize: 14.0,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'P ${data.totalPrice.toString()}',
                    style: const TextStyle(
                      fontFamily: 'Poopins',
                      fontSize: 14.0,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width * .8,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightGreenColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        fontFamily: 'Poopins',
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CartItemsAvailable extends StatelessWidget {
  const _CartItemsAvailable({
    Key? key,
    required this.height,
    required this.data,
  }) : super(key: key);

  final double height;
  final Data data;

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    if (data.items!.isNotEmpty) {
      return  ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.items?.length,
            itemBuilder: (context, index) {
              final dt = data.items![index];
              return CardItemList(
                title: dt.name,
                qty: dt.quantity,
                subTotal: dt.subTotalPrice,
              );
            });
    }

    return const Text(
      'Your Cart is Empty!',
      style: TextStyle(
          fontFamily: 'Poopins',
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.black45),
    );
  }
}

class CardItemList extends StatelessWidget {
  final String? title;
  final int? qty;
  final int? subTotal;
  const CardItemList({
    Key? key,
    required this.title,
    this.qty,
    required this.subTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width * .8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    AppUrl.shoesUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poopins'),
                    ),
                    const SizedBox(
                      width: 100.0,
                      child: Text(
                        "Ribbon Hardsole Shoes With Sound ",
                        style: TextStyle(
                            fontFamily: 'Poopins',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Qty: ${qty.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poopins',
                    color: AppColors.blackColor),
              ),
              Text(
                'P ${subTotal.toString()}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poopins',
                    color: AppColors.blackColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
