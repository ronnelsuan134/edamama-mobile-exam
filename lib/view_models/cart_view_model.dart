import 'package:ecommerce/models/get_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce/data/response/api_response.dart';
import 'package:ecommerce/repository/cart_repository.dart';

class CartViewModel with ChangeNotifier {
  final _cartRepo = CartRepository();

  ApiResponse<GetCartModel> cartList = ApiResponse.loading();

  setProduct(ApiResponse<GetCartModel> response) {
    cartList = response;
    notifyListeners();
  }

  Future<void> fetchCartItemList() async {
    await _cartRepo.getCart().then((res) {
      setProduct(ApiResponse.completed(res));
    }).onError(
        (error, stackTrace) => setProduct(ApiResponse.error(error.toString())));
  }
}
