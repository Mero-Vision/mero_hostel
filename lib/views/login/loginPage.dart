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
        backgroundColor: Color(0xff698AFF),
        body: SingleChildScrollView(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/loginlogo.png',
                height: ScreenHeight * 0.3,
                width: 270,
                fit: BoxFit.fill,
              ),
              LoginUI(),
            ],
          ),
        ),
      ),
    );
  }
}
