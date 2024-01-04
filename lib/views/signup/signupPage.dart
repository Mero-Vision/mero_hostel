// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/controller/loginRegister/registrationController.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';
import 'package:mero_hostel/utils/constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confPasswordController = TextEditingController();

  final RegistrationController controller = Get.find<RegistrationController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: AppColor.KBackgroundColor,
        backgroundColor: Colors.white,

        centerTitle: true,
        title: MyText(text: 'Sign Up', color: AppColor.KTextColor, size: 25.h),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogoContainer(),
              _buildFormField(
                'Name',
                nameController,
                'Enter your name.',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name Must Not Be Empty !';
                  }
                  return null;
                },
              ),
              _buildFormField(
                'Email',
                emailController,
                'Enter your email.',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email Must Not Be Empty !';
                  }
                  return null;
                },
              ),
              _buildFormField(
                'Password',
                passwordController,
                'Enter your password.',
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password Must Not Be Empty !';
                  }
                  if (passwordController.text.trim().characters.length < 8) {
                    return 'Password Must Not Be Less than 8 Digits !';
                  }
                  return null;
                },
              ),
              _buildFormField(
                'Confirm Password',
                confPasswordController,
                'Enter your password again.',
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty ||
                      passwordController.text.trim() !=
                          confPasswordController.text.trim()) {
                    return 'Did not matched to Password !';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              _buildSignUpButton(),
            ],
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
      ).marginOnly(top: 50.h, bottom: 50.h),
    );
  }

  Widget _buildFormField(
    String labelText,
    TextEditingController controller,
    String hintText, {
    bool obscureText = false,
    FormFieldValidator<String>? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
            text: labelText,
            color: AppColor.KTextColor,
            size: 20.h,
            top: 10.h,
            left: 30.h),
        MyTextFormField(
          controller: controller,
          top: 10.h,
          left: 20.h,
          right: 20.h,
          hintText: hintText,
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Obx(() => Center(
          child: controller.isLoading.value
              ? MyButton(
                  text: "Loading...",
                  onTap: () {},
                )
              : MyButton(
                  text: 'Sign Up',
                  top: 10.h,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var status = await controller.sendRegistrationRequest(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        confPasswordController.text.trim(),
                      );
                      if (status) {
                        nameController.clear();
                        emailController.clear();
                        passwordController.clear();
                        confPasswordController.clear();
                      } else {}
                    }
                  },
                  bottom: 20.h,
                ),
        ));
  }
}
