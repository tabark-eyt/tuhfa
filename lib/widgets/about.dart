import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuhfa/enums.dart';
import 'package:tuhfa/providers/about_provider.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Provider.of<AboutProvider>(context, listen: false).getAbout();
    });
    return Consumer<AboutProvider>(builder: (context, about, _) {
      if (about.state == ScreenState.busy) {
        return SizedBox();
      }

      return
        Center(

          child:  Container(

            width: 330.0,
            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),

            child:  Column(
              children: about.model.map((e) {

return      Container(
  padding: EdgeInsets.only(left: 5, top: 10, right: 10, bottom: 5),
  child: Text( e.description.toString(),
      style: TextStyle(fontFamily: 'Cairo', color: Color.fromRGBO(21, 21, 21, 1.0), fontSize: 13.0,)),

);




              }).toList()





            ),
          ) ,
        );

    });
  }

}
