// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/login/LoginUI.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(120)),
                child: Image.asset(
                  'assets/images/login_sign_Background.png',
                  height: ScreenHeight * 0.35,
                  width: ScreenWidth,
                  fit: BoxFit.fill,
                ),
              ),
              LoginUI(),
            ],
          ),
        ),
      ),
    );
  }
}
