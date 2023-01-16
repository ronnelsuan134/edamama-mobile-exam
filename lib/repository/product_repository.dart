import 'package:ecommerce/data/network/network_api_services.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/models/single_product_model.dart';
import 'package:ecommerce/res/app_url.dart';

class ProductRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<Products> getProducts() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.getProducts);
      return response = Products.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<SingleProductModel> getSingleProduct(String id) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse("${AppUrl.getSingleProduct}$id");
      return response = SingleProductModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
