import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_store_client/model/product/product.dart';
import 'package:phl_shoe_store_client/model/product_category/product_category.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;

  List<Product> products = [];
  List<Product> productShowInUI = [];
  List<ProductCategory> productCategory = [];

  @override
  void onInit() async {
    productCollection = firestore.collection('products');
    categoryCollection = firestore.collection('category');
    await fetchProduct();
    await fetchCategory();
    super.onInit();
  }

  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      productShowInUI.assignAll(products);
      Get.snackbar("Success", "Products fetched successfully",
          colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<ProductCategory> retrievedCategories = categorySnapshot.docs
          .map((doc) =>
              ProductCategory.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      productCategory.clear();
      productCategory.assignAll(retrievedCategories);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  filterByCategory(String category) {
    productShowInUI.clear();
    productShowInUI =
        products.where((product) => product.category == category).toList();
    update();
  }
}
