import 'package:flutter/material.dart';
import 'package:mero_hostel/widgets/Mytext.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [MyText(text: 'Login', color: Colors.black)],
        ),
      ),
    );
  }
}
