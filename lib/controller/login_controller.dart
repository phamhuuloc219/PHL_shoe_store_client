import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_store_client/model/user/user.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userColecttion;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();

  @override
  void onInit() {
    userColecttion = firestore.collection('users');
    super.onInit();
  }

  addUser() {
    try {
      if (registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty) {
        Get.snackbar("Error", 'Please fill all fields', colorText: Colors.red);
        return;
      }
      DocumentReference doc = userColecttion.doc();
      User user = User(
        id: doc.id,
        name: registerNameCtrl.text,
        number: int.parse(registerNumberCtrl.text),
      );
      final userJson = user.toJson();
      doc.set(userJson);
      Get.snackbar("Success", 'User added successfully!',
          colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    }
  }
}
