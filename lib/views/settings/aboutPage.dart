import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mero_hostel/customWidgets/Mytext.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About Mero Hostel'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
                child: Image.asset(
              'assets/images/hostelLogo.png',
              height: 200,
              width: 200,
            )),
            Card(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "'Mero Hostel' stands out as a state-of-the-art option in the management and search settings for hostels, representing a smooth user experience. This extremely sophisticated Android and web-based application was painstakingly created by its development team with the sole purpose of redefining hostel management. Using the stable Flutter front-end framework, Laravel API, and MySQL database, the application is an example of technological innovation that guarantees a strikingly user-friendly interface in addition to dependable performance."),
              ),
            ).marginAll(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _picSection(
                    image: 'assets/images/azzayaImage.png',
                    title: 'Ajaya Timsina',
                    subTitle: 'Developer'),
                _picSection(
                    image: 'assets/images/HancieImage.png',
                    title: 'Hancie Phago',
                    subTitle: 'Developer'),
                _picSection(
                    image: 'assets/images/niteshImage.png',
                    title: 'Nitesh Hamal',
                    subTitle: 'Developer')
              ],
            ).marginOnly(bottom: 20)
          ],
        ),
      ),
    );
  }

  Widget _picSection(
      {required String image,
      required String title,
      required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30.h),
            child: Image.asset(
              image,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            )),
        MyText(
          size: 18,
          fontWeight: FontWeight.w700,
          text: title,
        ),
        MyText(
          size: 18,
          fontWeight: FontWeight.w400,
          text: subTitle,
        )
      ],
    );
  }
}
