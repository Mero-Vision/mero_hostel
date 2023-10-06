// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginController.dart';
import 'package:mero_hostel/views/forgot_password/forgotPassword.dart';
import 'package:mero_hostel/views/signup/signupPage.dart';
import 'package:mero_hostel/widgets/Mytext.dart';
import 'package:mero_hostel/widgets/myRichText.dart';
import 'package:mero_hostel/widgets/myTextFormField.dart';
import 'package:mero_hostel/widgets/mybutton.dart';

var loginController = Get.find<LoginController>();

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    LoginController controller = Get.put(LoginController());
    log(
      '${loginController.isLoading.value}',
    );
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff698AFF),
        body: Stack(
          children: [
            SizedBox(
              height: ScreenHeight,
              width: ScreenWidth,
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/icons/loginlogo.png',
                height: 250,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 600,
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      )),
                  child: Column(
                    children: [
                      Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: MyText(
                                text: 'Login',
                                color: KTextColor,
                                size: 32,
                                top: 25,
                                bottom: 30,
                              ),
                            ),
                            MyText(
                              text: 'Email',
                              color: KTextColor,
                              size: 20,
                              left: 30,
                            ),
                            MyTextFormField(
                              controller: EmailController,
                              top: 10,
                              left: 20,
                              right: 20,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is required!';
                                }
                                return null;
                              },
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is required!';
                                }
                                return null;
                              },
                              hintText: 'Enter your password.',
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: MyText(
                                top: 10,
                                right: 20,
                                bottom: 20,
                                text: 'Forgot Password?',
                                ontap: () {
                                  Get.to(() => ForgotPassword());
                                },
                                color: Color(0xff0E6A28),
                                size: 18,
                              ),
                            ),
                            Obx(
                              () => Center(
                                child: loginController.isLoading.value
                                    ? MyButton(
                                        text: "Loading...",
                                        ontap: () {},
                                      )
                                    : MyButton(
                                        text: 'Login',
                                        ontap: () {
                                          if (_formkey.currentState!
                                              .validate()) {
                                            controller.login(
                                              EmailController.text.toString(),
                                              PasswordController.text
                                                  .toString(),
                                            );
                                          }
                                        },
                                        bottom: 20,
                                      ),
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          SignupPage(),
                                    ),
                                  );
                                },
                                child: MyRichText(
                                  text1: 'Don\'t have an account?  ',
                                  text2: 'Sign up',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        )

        // SingleChildScrollView(
        //   child: SizedBox(
        //     height: ScreenHeight, // Set a fixed height
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         SizedBox(
        //           height: ScreenHeight * 0.1,
        //         ),
        //         Image.asset(
        //           'assets/icons/loginlogo.png',
        //           height: ScreenHeight * 0.3,
        //           width: 270,
        //           fit: BoxFit.fill,
        //         ),
        //         Expanded(
        //           child: Container(
        //             width: ScreenWidth,
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.only(
        //                 topLeft: Radius.circular(50),
        //                 topRight: Radius.circular(50),
        //               ),
        //             ),
        //             child: Form(
        //               key: _formkey,
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Center(
        //                     child: MyText(
        //                       text: 'Login',
        //                       color: KTextColor,
        //                       size: 32,
        //                       top: 15,
        //                       bottom: 30,
        //                     ),
        //                   ),
        //                   MyText(
        //                     text: 'Email',
        //                     color: KTextColor,
        //                     size: 20,
        //                     left: 30,
        //                   ),
        //                   MyTextFormField(
        //                     controller: EmailController,
        //                     top: 10,
        //                     left: 20,
        //                     right: 20,
        //                     validator: (value) {
        //                       if (value!.isEmpty) {
        //                         return 'Email is required!';
        //                       }
        //                       return null;
        //                     },
        //                     hintText: 'Enter your email.',
        //                   ),
        //                   MyText(
        //                     text: 'Password',
        //                     color: KTextColor,
        //                     size: 20,
        //                     top: 20,
        //                     left: 30,
        //                   ),
        //                   MyTextFormField(
        //                     controller: PasswordController,
        //                     top: 10,
        //                     left: 20,
        //                     right: 20,
        //                     validator: (value) {
        //                       if (value!.isEmpty) {
        //                         return 'Password is required!';
        //                       }
        //                       return null;
        //                     },
        //                     hintText: 'Enter your password.',
        //                   ),
        //                   Align(
        //                     alignment: Alignment.topRight,
        //                     child: MyText(
        //                       top: 10,
        //                       right: 20,
        //                       bottom: 20,
        //                       text: 'Forgot Password?',
        //                       ontap: () {},
        //                       color: Color(0xff0E6A28),
        //                       size: 18,
        //                     ),
        //                   ),
        //                   Center(
        //                     child: MyButton(
        //                       text: 'Login',
        //                       ontap: () {
        //                         if (_formkey.currentState!.validate()) {
        //                           controller.login(
        //                             EmailController.text.toString(),
        //                             PasswordController.text.toString(),
        //                           );
        //                         }
        //                       },
        //                       bottom: 20,
        //                     ),
        //                   ),
        //                   Center(
        //                     child: GestureDetector(
        //                       onTap: () {
        //                         Navigator.push(
        //                           context,
        //                           PageRouteBuilder(
        //                             pageBuilder: (context, a, b) => SignupPage(),
        //                           ),
        //                         );
        //                       },
        //                       child: MyRichText(
        //                         text1: 'Don\'t have an account?  ',
        //                         text2: 'Sign up',
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
