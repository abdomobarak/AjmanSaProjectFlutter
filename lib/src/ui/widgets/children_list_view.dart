import 'package:ajman_app/src/models/children_json_model.dart';
import 'package:ajman_app/src/providers/children_provider.dart';
import 'package:ajman_app/src/ui/screens/children_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



Widget childrenList(BuildContext context){
  var childrenProvider = Provider.of<ChildrenProvider>(context);
  return AnimationLimiter(
    child:  AnimationConfiguration.synchronized(
      duration: const Duration(seconds: 1),
       child: SlideAnimation(
       verticalOffset: 100.0,
       child: FadeInAnimation(
         child: ListView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           padding: EdgeInsets.all(5),
           itemCount: childrenProvider.childreList.length,
           itemBuilder: (context, index) => childrenListItem(context,childrenProvider.childreList[index]),
         ),
       )
       )
    ),

  );

}



childrenListItem(BuildContext context, Children childrenList) {
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ChildrenDetailsScreen(childrenList:childrenList),)
      );
    },
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: FadeInImage.assetNetwork(
              image: 'https://ajmansa.com/' +'${childrenList.studentimage}',
              placeholder:'images/spinner.gif',
              fit: BoxFit.fill,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(childrenList.studentname ,
            style: GoogleFonts.amiri(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color:Color(0xff0e4c53)
            ),),
        ),
      ],
    ),
  );

}