class AppUrl {
  //change base on your network ip to connect nest js api
  static var baseApiUrl = 'http://192.168.0.19:3000/'; 

  static const logoUrl = 'assets/logo/logo.png';
  static const bannerUrl = 'assets/banner/banner.png';
  static  const shoesUrl = 'assets/product/shoes.png';

  static var productId ='';
  static var skip = 0;
  static var take = 5;
  
  static var getProducts =  '${baseApiUrl}products?skip=$skip&take=$take';
  static var getSingleProduct = '${baseApiUrl}products/';
  static var cart = '${baseApiUrl}cart';
}
