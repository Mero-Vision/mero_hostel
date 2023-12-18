// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import 'package:mero_hostel/customWidgets/Mytext.dart';
// import 'package:mero_hostel/models/hostelModel.dart';
// import 'package:mero_hostel/views/normalUser/homeTab/pages/viewHostel.dart';

// class ListOfHostel extends StatelessWidget {
//   const ListOfHostel({
//     Key? key,
//     this.data,
//   }) : super(key: key);
//   final RxList<Datum>? data;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: Obx(
//       () => ListView.builder(
//         itemCount: data!.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => ViewHostel(data: data![index])));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15.h),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     blurRadius: 1,
//                     offset: Offset(2, 2),
//                   ),
//                 ],
//               ),
//               height: 130.h,
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(15.h),
//                     child: Image.network(
//                       data?[index].hostelImages ??
//                           'https://i.pinimg.com/236x/06/fd/9d/06fd9dde192fe02644663c4bda0cf6ca.jpg',
//                       fit: BoxFit.cover,
//                       height: 130.h,
//                       width: 130.h,
//                     ),
//                   ).paddingAll(7.h),
//                   Column(
//                     children: [
//                       MyText(
//                         text: data?[index].hostelName ?? 'Not Available',
//                         size: 20.h,
//                         fontweight: FontWeight.w600,
//                         color: Colors.grey.shade700,
//                       )
//                     ],
//                   ).marginAll(10.h)
//                 ],
//               ),
//             ).paddingAll(10),
//           );
//         },
//       ),
//     ));
//   }
// }
