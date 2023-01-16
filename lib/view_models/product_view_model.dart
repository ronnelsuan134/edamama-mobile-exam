import 'package:ecommerce/data/response/api_response.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce/models/single_product_model.dart';

class ProductViewModel with ChangeNotifier {
  final _productRepo = ProductRepository();

  ApiResponse<SingleProductModel> product = ApiResponse.loading();

  setProduct(ApiResponse<SingleProductModel> response) {
    product = response;
    notifyListeners();
  }

  Future<void> fetchSingleProduct(String productId) async {
    await _productRepo.getSingleProduct(productId).then((res) {
      setProduct(ApiResponse.completed(res));
    }).onError(
        (error, stackTrace) => setProduct(ApiResponse.error(error.toString())));
  }
}
