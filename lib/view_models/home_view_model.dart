import 'package:ecommerce/data/response/api_response.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final _productRepo = ProductRepository();

  ApiResponse<Products> productList = ApiResponse.loading();

  setProductList(ApiResponse<Products> response) {
    productList = response;
    notifyListeners();
  }

  Future<void> fetchProductList() async {
    await _productRepo.getProducts().then((res) {
      setProductList(ApiResponse.completed(res));
    }).onError((error, stackTrace) =>
        setProductList(ApiResponse.error(error.toString())));
  }
}
