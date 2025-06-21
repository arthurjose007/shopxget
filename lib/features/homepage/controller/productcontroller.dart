import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
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

  final _api = HomePageRepository();

  Future<void> fetchProduct() async {
    try {
      isLoading = true;
      final response = await _api.fetchProducts();

      if (response != null && response['status'] == 200) {
        // final products = (response['data']["products"] as List)
        //     .map((item) => Product.fromJson(item))
        //     .toList();
        final products = ProductDetailsModel.fromJson(response['data']);
        productList.value = products.products;

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
