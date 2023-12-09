// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mero_hostel/models/hostelModel.dart';

class ViewHostel extends StatelessWidget {
  const ViewHostel({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.hostelName.toString()),
      ),
      body: Column(
        children: [
          Container(
              height: 500.h,
              width: double.infinity,
              child: Image.network(
                data.hostelImages!,
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }
}
