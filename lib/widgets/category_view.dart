import 'package:accordion/accordion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuhfa/category.dart';
import 'package:tuhfa/enums.dart';
import 'package:tuhfa/providers/cattegory_provider.dart';

class categoryView extends StatelessWidget {
  const categoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Provider.of<categoryProvider>(context, listen: false).getCat();
    });
    return Consumer<categoryProvider>(builder: (context, category, _) {
      if (category.state == ScreenState.busy) {
        return SizedBox();
      }


      return    Row(

      children: category.model.map((e) {
      return Container(
      height: 150.0,
      padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
      margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10)),
      boxShadow: [
      BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 3,
      blurRadius: 5,
      offset: Offset(0, 1), // changes position of shadow
      ),
      ],
      ),
      child: Column(
      children: [
      CachedNetworkImage(
      imageUrl: 'https://abualhassan.pythonanywhere.com${e.image.toString()}',
      height: 100,
      width: 94,
      placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) {
      debugPrint('error: $error');
      return Icon(Icons.error);
      },
      ),
      Text(
      e.name.toString(),
      style: TextStyle(
      fontFamily: 'Cairo',
      color: Color.fromRGBO(147, 0, 15, 1.0),
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      ),
      )
          ]
      ),
      );

      }).toList());

    });
  }
}
