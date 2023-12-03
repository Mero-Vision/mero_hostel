import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myRichText.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/forgot_password/forgotPassword.dart';
import 'package:mero_hostel/views/login/widget/custom_note.dart';
import 'package:mero_hostel/views/signup/signupPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  LoginController controller = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: 500.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                        child: const CustomNote(
                                text:
                                    'Note: \n  You must Login to view your profile! ')
                            .marginOnly(top: 50.h)),
                    MyText(
                      text: 'Email',
                      color: KTextColor,
                      size: 20,
                      left: 30,
                    ),
                    MyTextFormField(
                      controller: EmailController,
                      top: 10.h,
                      left: 20.h,
                      right: 20.h,
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
                      size: 20.h,
                      top: 20.h,
                      left: 30.h,
                    ),
                    MyTextFormField(
                      controller: PasswordController,
                      top: 10.h,
                      left: 20.h,
                      right: 20.h,
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
                        top: 10.h,
                        right: 20.h,
                        bottom: 20.h,
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
                        child: controller.isLoading.value
                            ? MyButton(
                                text: "Loading...",
                                onTap: () {},
                              )
                            : MyButton(
                                text: 'Login',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.login(
                                      EmailController.text.toString(),
                                      PasswordController.text.toString(),
                                    );
                                  }
                                },
                                bottom: 20.h,
                              ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => SignupPage(),
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
            ),
          ),
        ),
      ),
    );
  }
}
