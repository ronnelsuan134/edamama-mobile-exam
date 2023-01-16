import 'package:ecommerce/data/response/status.dart';
import 'package:ecommerce/view_models/home_view_model.dart';
import 'package:ecommerce/view/home/product/featured_product_item.dart';
import 'package:ecommerce/res/color.dart';
import 'package:ecommerce/res/app_url.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FeaturedProductList extends StatefulWidget {
  const FeaturedProductList({super.key});

  @override
  State<FeaturedProductList> createState() => _FeaturedProductListState();
}

class _FeaturedProductListState extends State<FeaturedProductList> {
  HomeViewModel homeViewModel = HomeViewModel();
  late PageController _pageController;
  int activePage = 1;
  @override
  void initState() {
    homeViewModel.fetchProductList();
    _pageController = PageController(viewportFraction: 0.4, initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'FEATURED PRODUCTS',
                style: TextStyle(
                    color: AppColors.greenDarkColor,
                    fontFamily: 'Poopins',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: AppColors.greenDarkColor,
                    fontFamily: 'Poopins',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChangeNotifierProvider<HomeViewModel>(
                  create: (BuildContext context) => homeViewModel,
                  child:
                    Consumer<HomeViewModel>(builder: (context, value, _) {
                    switch (value.productList.status) {
                      case Status.LOADING:
                        return SizedBox(
                          height: height,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      case Status.ERROR:
                        return SizedBox(
                            width: width * .5,
                            child: Text(value.productList.toString()));
                      case Status.COMPLETED:
                        return Column(children: [
                          SizedBox(
                            height: height * .02,
                          ),
                          _productList(height, width, value),
                        ]);
                      default:
                        return const Text("test");
                    }
                  })),
            ],
          )
        ],
      ),
    );
  }

  Widget _productList(double height, double width,HomeViewModel value) {
    return SizedBox(
      height: height * .5,
      width: width,
      child: PageView.builder(
          itemCount:value.productList.data!.data!.length,
          pageSnapping: true,
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              activePage = page;
            });
          },
          itemBuilder: (context, index) {
            return FeatureProductItem(results: value.productList.data!.data![index]);
          }),
    );
  }
}
