import 'package:flutter/material.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/widgets/Mytext.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  scale: 0.5,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ScreenHeight * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(53),
                        topRight: Radius.circular(53))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
