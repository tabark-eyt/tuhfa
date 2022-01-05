import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:tuhfa/enums.dart';
import 'package:tuhfa/providers/post_provider.dart';

import '../postdetails.dart';



class PostView extends StatefulWidget {

  const PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();

}


class _PostViewState extends State<PostView>  {



  @override
  Widget gallerypost(String title, String description, String image, String date){

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => postdetails(
                title: title,
                description:description,
                image:image,
                date: date,

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
      await Provider.of<PostProvider>(context, listen: false).getPost();
    });
    return Consumer<PostProvider>(builder: (context, post, _) {
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
            return gallerypost(e.title.toString(), e.description.toString(), e.image.toString(), e.createdOn.toString());
          }).toList());
    });
  }
}
