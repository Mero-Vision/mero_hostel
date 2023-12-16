import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mero_hostel/customWidgets/myTextFormField.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: MyTextFormField(
          hintText: 'Search',
          controller: controller,
          prefix: Icon(
            CupertinoIcons.search,
            size: 25.h,
            // color: Colors.black,
          ),
        ),
      ),
    );
  }
}
