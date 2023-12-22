// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/loginController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myRichText.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/forgot_password/forgotPassword.dart';
import 'package:mero_hostel/views/signup/signupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var controller = Get.find<LoginController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.KBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLogoContainer(),
                  _buildFormField('Email', emailController, 'Enter your email.',
                      validator: _validateEmail),
                  _buildFormField(
                      'Password', passwordController, 'Enter your password.',
                      validator: _validatePassword),
                  _buildForgotPasswordText(),
                  _buildLoginButton(),
                  _buildSignUpLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoContainer() {
    return Center(
      child: SizedBox(
        height: 140.h,
        child: Image.asset(
          'assets/images/MainRectangleLogo.png',
          fit: BoxFit.fill,
        ),
      ).marginOnly(top: 130.h, bottom: 50.h),
    );
  }

  Widget _buildFormField(
      String labelText, TextEditingController controller, String hintText,
      {FormFieldValidator<String>? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: labelText, color: AppColor.KTextColor, size: 20, left: 30),
        MyTextFormField(
          controller: controller,
          top: 10.h,
          left: 20.h,
          right: 20.h,
          validator: validator,
          hintText: hintText,
        ),
      ],
    );
  }

  Widget _buildForgotPasswordText() {
    return Align(
      alignment: Alignment.topRight,
      child: MyText(
        top: 10.h,
        right: 20.h,
        bottom: 20.h,
        text: 'Forgot Password?',
        onTap: () {
          Get.to(() => const ForgotPassword());
        },
        color: AppColor.KGreenColor,
        size: 18,
      ),
    );
  }

  Widget _buildLoginButton() {
    return Obx(
      () => Center(
        child: controller.isLoading.value
            ? MyButton(
                text: "Loading...",
                onTap: () {},
              )
            : MyButton(
                text: 'Login',
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await controller.login(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );
                  }
                },
                bottom: 20.h,
              ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, a, b) => const SignUpPage(),
            ),
          );
        },
        child: const MyRichText(
          text1: 'Don\'t have an account?  ',
          text2: 'Sign up',
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required!';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required!';
    }
    return null;
  }
}
