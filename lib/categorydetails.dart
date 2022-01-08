import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tuhfa/category.dart';
import 'package:tuhfa/models/gen/category_model.dart';
import 'package:tuhfa/enums.dart';
import 'package:tuhfa/postdetails.dart';
import 'package:tuhfa/providers/cattegory_provider.dart';


class categorydetails extends StatefulWidget {
  int? cat_id;

  categorydetails(
      {this.cat_id

      });

  @override
  _categorydetailsState createState() => _categorydetailsState();

}



class _categorydetailsState extends State<categorydetails>  {


  @override

  Widget categorypost(String title, String description, String image,){

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => postdetails(
                title: title,
                description:description,
                image:image,


              ),
            ));
      },

      child: Expanded(
        child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://abualhassan.pythonanywhere.com$image',
                fit: BoxFit.cover,
              ),
            )),
      ),
      // child: Card(
      //   elevation: 0,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: [
      //         // FadeInImage.memoryNetwork(
      //         //   placeholder: kTransparentImage,
      //         //   image: product.image,
      //         //   height: 200,
      //         // ),
      //         CachedNetworkImage(
      //           imageUrl: 'https://abualhassan.pythonanywhere.com$image',
      //           height: 95,
      //           fit: BoxFit.fill,
      //           placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      //           errorWidget: (context, url, error) {
      //             debugPrint('error: $error');
      //             return Icon(Icons.error);
      //           },
      //         ),
      //         // Padding(
      //         //   padding: const EdgeInsets.all(8.0),
      //         //   child: Text(
      //         //     title,
      //         //     maxLines: 2,
      //         //     overflow: TextOverflow.ellipsis,
      //         //   ),
      //         // ),
      //
      //
      //       ],
      //     ),
      //   ),
      // ),

    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Provider.of<categoryProvider>(context, listen: false).getcatPost();
    });
    return MaterialApp(
        title: "New Task",
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromRGBO(255, 255, 255, 1.0),
    accentColor: const Color.fromRGBO(128, 0, 0, 1.0),
    fontFamily: 'Tajawal',
    primarySwatch: Colors.blue,

    ),
    home: Directionality( // add this
    textDirection: TextDirection.rtl, // set this property
    child: Scaffold(

    appBar: new AppBar(
    title: Center(
    child: Image.asset(
    'assets/photo_2021-11-25_17-49-44.jpg',
    height: 100.0,
    )),
      leading: GestureDetector(
          onTap: () {
            Navigator
                .pop(context);},
          child: Icon(Icons.arrow_back)),

    ),


    body:

    Container(

        color: const Color.fromRGBO(255, 255, 255, 1.0),



     child: Consumer<categoryProvider>(builder: (context, post, _) {
      if (post.state == ScreenState.busy) {
        return SizedBox();
      }


      return GridView(

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,

          ),
          physics: const NeverScrollableScrollPhysics(),
          // itemCount: snapshot.data!.length,
          children: post.model.map((e) {
            return categorypost(e.name.toString(), e.description.toString(), e.image.toString());
          }).toList());
    }),

    )

    )
    )
    );
  }
}
