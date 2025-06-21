import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shopxget/features/homepage/service/remote_service.dart';
import '../../../core/helper/utils/shared/component/widgets/custom_alert.dart';
import '../model/productmodel.dart';
import '../repository/homepage_repo.dart';

class ProductController extends GetxController {
  bool isLoading = true;
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  // void fetchProduct() async {
  //   isLoading = true; // Set loading to true
  //   update(); // Notify listeners
  //
  //   var products = await RemoteServices.fetchProducts();
  //   if (products != null) {
  //     productList.value = products.products; // Update the observable list
  //     print("Product List: $productList");
  //     print("Limit: ${products.limit}");
  //     print("First Image: ${products.products[0].images[0]}");
  //   }
  //
  //   isLoading = false; // Set loading to false
  //   update(); // Notify listeners again
  // }
  final _api = HomePageRepository();

  Future<void> fetchProduct() async {
    try {
      isLoading = true;
      final response = await _api.fetchProducts();

      if (response != null && response['status'] == 200) {
        print("vvvvvvvvvvvv${response['data']}");
        // final products = (response['data']["products"] as List)
        //     .map((item) => Product.fromJson(item))
        //     .toList();
        final products = ProductDetailsModel.fromJson(response['data']);
     productList.value=   products.products;

        print("This is the response");
        print(products);

      } else {
        CustomToast.showCustomErrorToast(message: "Unexpected error occurred");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    } finally {
      isLoading = false;
    }
  }
}
