import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/product_controller.dart';

class ProductScreen extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Product List"),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                  label: GetX<ProductController>(
                    builder: (controller){
                      return Text(
                        productController.count.toString()
                        );
                    },
                  ))
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: GetBuilder<ProductController>(
            builder: (controller) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 4,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 120,
                              width: double.infinity,
                              child: Image.network(productController
                                  .productData[index].productImage),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    productController
                                        .productData[index].productName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        productController.addtoFavorite(productController.productData[index].id);
                                      },
                                      icon: Icon(
                                        productController
                                                .productData[index].favourite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price : ${productController.productData[index].price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        productController.addtoCart(
                                          productController.productData[index]
                                        );
                                      },
                                      child: Text("Add to Cart"))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Text(productController
                                  .productData[index].productDescription),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: productController.productData.length);
            },
          )),
          SizedBox(height:10),
          GetX<ProductController>(
                    builder: (controller){
                      return  Text("Total Amount: ${productController.totalPrice}", style: TextStyle(fontSize: 20,
          color: Colors.white),);

                    }),
         
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
