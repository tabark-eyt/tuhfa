import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:accordion/accordion.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tuhfa/providers/calender_provider.dart';
import 'package:tuhfa/widgets/calender_view.dart';
import 'package:tuhfa/widgets/category_view.dart';
import 'package:tuhfa/widgets/theme_view.dart';
//
// Future<List> Category() async {
//   final response = await http.get(
//       Uri.parse(
//           'https://abualhassan.pythonanywhere.com/api/categories/get_all_categories'),
//       headers: {"accept": "application/json"});
//   var convertDatatoJson = jsonDecode(response.body);
//   return convertDatatoJson;
// }
//
// Future<List> Calender() async {
//   final response = await http.get(
//       Uri.parse(
//           'https://abualhassan.pythonanywhere.com/api/schedule/retrieve_all_schedules'),
//       headers: {"accept": "application/json"});
//   var convertDatatoJson = jsonDecode(response.body);
//   return convertDatatoJson;
// }
//
// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];
// final List<Widget> imageSliders = imgList
//     .map((item) => Container(
//           child: Container(
//             margin: EdgeInsets.all(5.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 child: Stack(
//                   children: <Widget>[
//                     Image.network(item, fit: BoxFit.cover, width: 1000.0),
//                     Positioned(
//                       bottom: 0.0,
//                       left: 0.0,
//                       right: 0.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(200, 243, 240, 240),
//                               Color.fromARGB(0, 0, 0, 0)
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 20.0),
//                         child: Text(
//                           'No. ${imgList.indexOf(item)} image',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//         ))
//     .toList();

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Task",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(255, 255, 255, 1.0),

        accentColor: const Color.fromRGBO(128, 0, 0, 1.0),
        fontFamily: 'Cairo',
        primarySwatch: Colors.blue,
      ),
      home: Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: Scaffold(
          appBar: new AppBar(
            title: Center(
                child: Image.asset(
              'assets/photo_2021-11-25_17-49-44.jpg',
              height: 100.0,
            )),
          ),
          body: ListView(children: <Widget>[
            SizedBox(height: 7.0),
            // new Container(
            //   color: const Color.fromRGBO(255, 255, 255, 1.0),
            //
            //   child: CarouselSlider(
            //     options: CarouselOptions(
            //       autoPlay: true,
            //       aspectRatio: 2.0,
            //       enlargeCenterPage: true,
            //     ),
            //     items: imageSliders,
            //   ),
            // ),
            themeView(),
            SizedBox(height: 7.0),
            Center(
                child: Text(
              'الاقسام',
              style: TextStyle(
                fontFamily: 'Cairo',
                color: Color.fromRGBO(147, 0, 15, 1.0),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 7.0),
            categoryView(),
            SizedBox(height: 7.0),
            Center(
                child: Text(
              'الجدول الاسبوع',
              style: TextStyle(
                fontFamily: 'Cairo',
                color: Color.fromRGBO(1, 85, 81, 1.0),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 7.0),
            CalenderView(),
          ]),
        ),
      ),
    );
  }

}
