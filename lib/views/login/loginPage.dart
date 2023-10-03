// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/login/LoginUI.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: ScreenHeight * 0.45,
                width: ScreenWidth,
                child: Image.asset(
                  'assets/images/login_sign_Background.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: ScreenHeight * 0.35,
              child: LoginUI(),
            ),
          ],
        ),
      ),
    );
  }
}
