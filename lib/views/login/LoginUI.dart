import 'package:flutter/material.dart';
import 'package:mero_hostel/utils/constant.dart';
import 'package:mero_hostel/views/signup/signupPage.dart';
import 'package:mero_hostel/widgets/Mytext.dart';
import 'package:mero_hostel/widgets/myRichText.dart';
import 'package:mero_hostel/widgets/myTextFormField.dart';
import 'package:mero_hostel/widgets/mybutton.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Login_SignUp',
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: ScreenHeight * 0.55,
          width: ScreenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: MyText(
                text: 'Login',
                color: KTextColor,
                size: 32,
                top: 15,
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
              top: 10,
              left: 20,
              right: 20,
              hintText: 'Enter your password.',
            ),
            Align(
              alignment: Alignment.topRight,
              child: MyText(
                  top: 10,
                  right: 20,
                  bottom: 20,
                  text: 'Forgot Password?',
                  ontap: () {},
                  color: Color(0xff0E6A28),
                  size: 18),
            ),
            Center(
                child: MyButton(
              text: 'Login',
              ontap: () {},
              bottom: 20,
            )),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, a, b) => SignupPage()));
                },
                child: MyRichText(
                    text1: 'Don\'t have a account?  ', text2: 'Sign up'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
