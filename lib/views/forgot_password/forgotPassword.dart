// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/forgotpasswordController.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff698AFF),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Image.asset(
                'assets/icons/loginlogo.png',
                width: 200,
                height: 250,
                fit: BoxFit.contain,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      AppBar(
                        title: const Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        elevation: 0,
                        shadowColor: const Color(0x00000000),
                        backgroundColor: const Color(0x00000000),
                        leading: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MyTextFormField(
                        top: 10,
                        left: 20,
                        right: 20,
                        hintText: 'Enter your emil',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyButton(
                          text: "Send Email",
                          onTap: () {
                            ForgotPasswordController()
                                .sendEmail(emailController.text.toString());
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                    const  Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Card(
                          shadowColor: Colors.grey,
                          child: Padding(
                            padding:  EdgeInsets.all(10.0),
                            child: Text(
                                "Note: Please enter your email address. A password reset link will be sent to your email for your convenience."),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
