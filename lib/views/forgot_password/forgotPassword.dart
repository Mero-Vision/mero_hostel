import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/forgotpasswordController.dart';
import 'package:mero_hostel/widgets/myTextFormField.dart';
import 'package:mero_hostel/widgets/mybutton.dart';

import '../../api/forgotpasswordapi.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xff698AFF),
      body: Column(
        children: [
          Image.asset(
            'assets/icons/loginlogo.png',
            width: 200,
            height: 250,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    elevation: 0,
                    shadowColor: Color(0x00),
                    backgroundColor: Color(0x00),
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MyTextFormField(
                    top: 10,
                    left: 20,
                    right: 20,
                    hintText: 'Enter your emil',
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyButton(
                      text: "Send Email",
                      ontap: () {
                        ForgotPasswordController().sendEmail(emailController.text.toString());
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
    );
  }
}
