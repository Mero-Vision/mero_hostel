import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mero_hostel/customWidgets/mybutton.dart';

class HostelUserHomePage extends StatelessWidget {
  const HostelUserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('HostelUser'),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            MyButton(
                text: 'logout',
                onTap: () {
                  loginController.logout();
                }),
          ],
        ),
      ),
    );
  }
}
