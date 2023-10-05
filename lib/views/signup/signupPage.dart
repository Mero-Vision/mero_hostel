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
    return Scaffold(
      backgroundColor: Color(0xff698AFF),
      body: SingleChildScrollView(
        child: Container(
          height: ScreenHeight,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenHeight * 0.06,
                    bottom: ScreenHeight * 0.01,
                    left: ScreenWidth * 0.1,
                    right: ScreenWidth * 0.1),
                child: Container(
                  height: ScreenHeight * 0.1,
                  child: Image.asset(
                    'assets/images/MainRectangleLogo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Hero(
                  tag: 'Login_SignUp',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      width: ScreenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBar(
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
                                text: 'Sign Up', color: KTextColor, size: 25),
                            backgroundColor: Color(0x00),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                text: 'Confirm Password',
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
                                hintText: 'Enter your password again.',
                                obscureText: true,
                              ),
                              MyText(
                                text: 'Status',
                                color: KTextColor,
                                size: 20,
                                top: 20,
                                left: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: MyDropMenu(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: MyButton(
                                  text: 'Sign Up',
                                  ontap: () {},
                                  bottom: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
