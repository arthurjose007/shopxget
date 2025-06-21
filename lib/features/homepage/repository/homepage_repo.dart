import '../../../core/helper/network_api_services.dart';

class HomePageRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchProducts() async {
    dynamic response = await _apiService.getApi(
        "https://dummyjson.com/products?limit=20&select=title,price,description,images");
    return response;
  }
}