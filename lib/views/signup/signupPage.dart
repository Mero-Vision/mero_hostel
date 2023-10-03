// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/widgets/Mytext.dart';
import 'package:mero_hostel/widgets/myRichText.dart';
import 'package:mero_hostel/widgets/myTextFormField.dart';
import 'package:mero_hostel/widgets/mybutton.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Image.asset(
                  'assets/images/login_sign_Background.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Hero(
                tag: 'Login_SignUp',
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    height: ScreenHeight * 0.71,
                    width: ScreenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: MyText(
                              text: 'Login',
                              color: KTextColor,
                              size: 32,
                              top: 15,
                              bottom: 30,
                            ),
                          ),
                        ]),
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
