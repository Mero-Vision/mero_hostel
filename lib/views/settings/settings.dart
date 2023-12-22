import 'package:flutter/material.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyText(text: 'Settings page', size: 20),
      ),
    );
  }
}
