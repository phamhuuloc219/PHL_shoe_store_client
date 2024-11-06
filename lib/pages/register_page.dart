import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_store_client/controller/login_controller.dart';
import 'package:phl_shoe_store_client/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Create Your Account!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ctrl.registerNameCtrl,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: "Enter your name"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ctrl.registerNumberCtrl,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: "Enter your mobile number"),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text('Register'),
              onPressed: () {
                ctrl.addUser();
              },
            ),
            TextButton(onPressed: () {}, child: Text("Login"))
          ]),
        ),
      );
    });
  }
}
