import 'package:ecommerce/data/network/network_api_services.dart';
import 'package:ecommerce/models/add_to_cart.dart';
import 'package:ecommerce/models/get_cart.dart';
import 'package:ecommerce/res/app_url.dart';

class CartRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<GetCartModel> getCart() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.cart);
      return response = GetCartModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<AddToCartModel> addToCart(data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.cart, data);
      return response = AddToCartModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
