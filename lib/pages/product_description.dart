// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:phl_shoe_store_client/controller/home_controller.dart';

// class ProductDescriptionPage extends StatelessWidget {
//   final int productIndex;

//   const ProductDescriptionPage({super.key, required this.productIndex});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (ctrl) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Product Details',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: SingleChildScrollView(
//           padding: EdgeInsets.all(20),
//           child: Builder(builder: (context) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(
//                     ctrl.products[2].image ??
//                         "https://firebasestorage.googleapis.com/v0/b/huuloc-firebase.appspot.com/o/phl_shoe_stores%2Fpuma%2Fz6002304171344_51ef4c5e8765068d4e0a2aceba746343.jpg?alt=media&token=c564e414-72fe-43ff-86a9-a5cc679caada",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   ctrl.products[2].name ?? "Product Name",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   ctrl.products[2].description ?? "Product Description",
//                   style: TextStyle(fontSize: 16, height: 1.5),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   "\$" + ctrl.products[2].price.toString() ?? "0.0",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   maxLines: 3,
//                   decoration: InputDecoration(
//                     labelText: 'Enter your Billing Address',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text(
//                         "Buy Now",
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(vertical: 15),
//                           backgroundColor: Colors.blue),
//                     )),
//               ],
//             );
//           }),
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_store_client/controller/home_controller.dart';
import 'package:phl_shoe_store_client/model/product/product.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.image ?? "",
                fit: BoxFit.contain,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.name ?? "",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              product.description ?? "",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              "Rs: \$${product.price?.toString() ?? "0.0"}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Enter your Billing Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
