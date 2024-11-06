import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';
import 'package:phl_shoe_store_client/model/user/user.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userColecttion;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShow = false;
  int? otpSend;
  int? otpEnter;

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
      print(otp);
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
}
