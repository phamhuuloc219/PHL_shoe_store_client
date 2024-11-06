import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_store_client/controller/login_controller.dart';
import 'package:phl_shoe_store_client/pages/home_page.dart';
import 'package:phl_shoe_store_client/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: ctrl.loginNumberCtrl,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: Icon(Icons.phone_android),
                        hintText: "Enter your phone number"),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: const Text('Login'),
                    onPressed: () {
                      ctrl.loginWithPhone();
                      // Get.to(HomePage());
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => RegisterPage(),
                        //     ));
                        Get.to(RegisterPage());
                      },
                      child: Text("Register new account"))
                ],
              )));
    });
  }
}
