
import 'package:flutter/cupertino.dart';
import 'package:ecommerce/data/response/api_response.dart';
import 'package:ecommerce/models/add_to_cart.dart';
import 'package:ecommerce/repository/cart_repository.dart';

class AddToCartViewModel with ChangeNotifier {

  final _cartRepo = CartRepository();

  ApiResponse<AddToCartModel> product = ApiResponse.loading();

    setProduct(ApiResponse<AddToCartModel> response) {
    product = response;
    notifyListeners();
  }

  Future<void> fetchAddToCart({required String productId,required String title,required  qty,required  price }) async {
    final data = {'productId':productId,'name':title,'quantity':qty,'price':price};

    await _cartRepo.addToCart(data).then((res) {
      setProduct(ApiResponse.completed(res));
    }).onError(
        (error, stackTrace) => setProduct(ApiResponse.error(error.toString())));
  }

}
