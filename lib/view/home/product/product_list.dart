import 'package:ecommerce/res/app_url.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/view/home/product/product_item.dart';
import 'package:ecommerce/view/home/product/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/data/response/status.dart';
import 'package:ecommerce/view_models/home_view_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    homeViewModel.fetchProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const Text(
            'MAMA & KIDS MUST-HAVES',
            style: TextStyle(
                fontFamily: 'Poopins',
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor),
          ),
          ChangeNotifierProvider<HomeViewModel>(
            create: (BuildContext context) => homeViewModel,
            child: Consumer<HomeViewModel>(builder: (context, value, _) {
              switch (value.productList.status) {
                case Status.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case Status.ERROR:
                  return SizedBox(
                      width: width * .5,
                      child: Text(value.productList.toString()));
                case Status.COMPLETED:
                  return Column(
                    children: [
                      SizedBox(
                        height: height * .02,
                      ),
                     _productList(height,value)
                    ],
                  );
                default:
                  return const Text("test");
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _productList(double height, HomeViewModel value) {
    return SafeArea(
    child:GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 4/7,
        crossAxisCount: 2,
      ),
      itemCount: value.productList.data!.data!.length,
      itemBuilder: (_, index) {
        return ProductItem(data: value.productList.data!.data![index],);
      },
    )
,
    );
  }
}
