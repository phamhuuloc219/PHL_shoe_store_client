import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';
import 'package:phl_shoe_store_client/model/user/user.dart';
import 'package:phl_shoe_store_client/pages/home_page.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userColecttion;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();

  TextEditingController loginNumberCtrl = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShow = false;
  int? otpSend;
  int? otpEnter;

  User? loginUser;

  @override
  void onReady() {
    Map<String, dynamic>? user = box.read("loginUser");
    if (user != null) {
      loginUser = User.fromJson(user);
      Get.to(const HomePage());
    }
    super.onReady();
  }

  @override
  void onInit() {
    userColecttion = firestore.collection('users');
    super.onInit();
  }

  addUser() {
    try {
      if (otpSend == otpEnter) {
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
        registerNameCtrl.clear();
        registerNumberCtrl.clear();
        otpFieldShow = false;
        otpController.clear();
      } else {
        Get.snackbar("Error", 'OTP does not match', colorText: Colors.red);
      }
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  sendOTP() {
    try {
      if (registerNameCtrl.text.isEmpty || registerNumberCtrl.text.isEmpty) {
        Get.snackbar("Error", 'Please fill all fields', colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      // send otp and check its send successfully or not
      if (otp != null) {
        otpFieldShow = true;
        otpSend = otp;
        Get.snackbar("Success", 'OTP sent successfully!',
            colorText: Colors.green);
        Get.snackbar("OTP", 'OTP is $otpSend',
            colorText: Colors.green, duration: Duration(seconds: 6));
      } else {
        Get.snackbar("Error", 'Failed to send OTP', colorText: Colors.red);
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      update();
    }
  }

  Future<void> loginWithPhone() async {
    try {
      String phoneNumber = loginNumberCtrl.text;
      if (phoneNumber.isNotEmpty) {
        var querySnapshot = await userColecttion
            .where('number', isEqualTo: int.tryParse(phoneNumber))
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
          box.write("loginUser", userData);
          loginNumberCtrl.clear();
          Get.to(const HomePage());
          Get.snackbar("Success", "Login successful", colorText: Colors.green);
        } else {
          Get.snackbar("Error", "User not found, please register",
              colorText: Colors.red);
        }
      } else {
        Get.snackbar("Error", "Please enter phone number",
            colorText: Colors.red);
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to login", colorText: Colors.red);
    }
  }
}
