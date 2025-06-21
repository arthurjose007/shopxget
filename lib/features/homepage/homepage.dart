import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopxget/features/homepage/controller/productcontroller.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Shopx",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
              IconButton(onPressed: () {}, icon: Icon(Icons.grid_view))
            ],
          ),
          Expanded(
              child: Obx(
            () => GridView.builder(
              itemCount: productController.productList.length,
              // crossAxisCount: 2,
              itemBuilder: (context, index) {
                var productList = productController.productList;
                return Container(
                  height: 300,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      side: BorderSide(
                        color: Colors.blue, // Your border color
                        width: 2, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, bottom: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          productList[index].images[0].isNotEmpty
                              ? Image.network(
                                  height: 150,
                                  productList[index].images[0],
                                  fit: BoxFit.cover,
                                )
                              : Center(child: Icon(Icons.image)),
                          Text(productList[index].title ?? "",
                              style: TextStyle(
                                fontSize: 18,

                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),),
                          SizedBox(
                            height: 15,
                          ),
                          Text("\$" + productList[index].price.toString(),
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              )),

                        ],
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 0.6
              ),
              //staggeredTileBuilder: (index) => StaggeredTile.fit(1), gridDelegate: null,
            ),
          )),
        ],
      ),
    );
  }
}
