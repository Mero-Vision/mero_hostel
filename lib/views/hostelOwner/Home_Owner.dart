import 'package:flutter/material.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';

class HomeOwner extends StatelessWidget {
  const HomeOwner({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          leading: MenuBar(children: [
            Text('hello'),
            Text('hello'),
            Text('hello'),
            Text('hello')
          ]),
          title: const MyText(
            size: 20,
            text: 'PCPS Hostel',
          )),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
