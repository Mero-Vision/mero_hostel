// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/widgets/Mytext.dart';
import 'package:mero_hostel/widgets/myTextFormField.dart';
import 'package:mero_hostel/widgets/mybutton.dart';

import '../../widgets/myDropMenu.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff698AFF),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: ScreenHeight * 0.3,
                width: 270,
                child: Image.asset(
                  'assets/images/loginlogo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: ScreenHeight * 0.25,
              child: Hero(
                tag: 'Login_SignUp',
                child: Material(
                  type: MaterialType.transparency,
                  child: SingleChildScrollView(
                    child: Container(
                      height: ScreenHeight * 0.71,
                      width: ScreenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: AppBar(
                                  elevation: 0,
                                  shadowColor: Color(0x00),
                                  leading: IconButton(
                                    padding: EdgeInsets.only(left: 20),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(Icons.arrow_back),
                                    color: KTextColor,
                                  ),
                                  centerTitle: true,
                                  title: MyText(
                                      text: 'Sign Up',
                                      color: KTextColor,
                                      size: 25),
                                  backgroundColor: Color(0x00),
                                ),
                              ),
                              MyText(
                                text: 'Name',
                                color: KTextColor,
                                size: 20,
                                left: 30,
                              ),
                              MyTextFormField(
                                controller: EmailController,
                                top: 10,
                                left: 20,
                                right: 20,
                                hintText: 'Enter your name.',
                              ),
                              MyText(
                                text: 'Email',
                                color: KTextColor,
                                top: 20,
                                size: 20,
                                left: 30,
                              ),
                              MyTextFormField(
                                controller: EmailController,
                                top: 10,
                                left: 20,
                                right: 20,
                                hintText: 'Enter your email.',
                              ),
                              MyText(
                                text: 'Password',
                                color: KTextColor,
                                size: 20,
                                top: 20,
                                left: 30,
                              ),
                              MyTextFormField(
                                controller: PasswordController,
                                top: 10,
                                left: 20,
                                right: 20,
                                hintText: 'Enter your password.',
                                obscureText: true,
                              ),
                              MyText(
                                text: 'Conform Password',
                                color: KTextColor,
                                size: 20,
                                top: 20,
                                left: 30,
                              ),
                              MyTextFormField(
                                controller: ConfPasswordController,
                                top: 10,
                                left: 20,
                                right: 20,
                                bottom: 80,
                                hintText: 'Enter your password again.',
                                obscureText: true,
                              ),
                              MyDropMenu(),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: MyButton(
                                text: 'Login',
                                ontap: () {},
                                bottom: 20,
                              )),
                              SizedBox(
                                height: 10,
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
