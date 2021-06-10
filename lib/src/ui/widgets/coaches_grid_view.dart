import 'package:ajman_app/src/models/coaches_json_model.dart';
import 'package:ajman_app/src/providers/coaches_provider.dart';
import 'package:ajman_app/src/ui/screens/coach_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


Widget buildCoachesList(BuildContext context){

  var coachesProvider = Provider.of<CoachesProvider>(context);
   return AnimationLimiter(
     child:  AnimationConfiguration.synchronized(
       duration: const Duration(seconds: 1),
       child: SlideAnimation(
         verticalOffset: 100.0,
         child: FadeInAnimation(
           child: GridView.builder(
             shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: coachesProvider.coachesList.length,
               itemBuilder: (context, index) => coachListItem(context,coachesProvider.coachesList[index]),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
                 childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ?
                 MediaQuery.of(context).size.width /
                     (MediaQuery.of(context).size.height / 1.5)
                     : MediaQuery.of(context).size.width /
                     (MediaQuery.of(context).size.height / 0.3),
               )
           ),
         ),
       ),
     ),
   );
}



coachListItem(BuildContext context, Coachs coachesList) {

return GestureDetector(
  onTap: (){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CoachDetailsScreen(coachesList:coachesList),));
  },
  child: Column(
    children: [

      ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: FadeInImage.assetNetwork(
          image: 'https://ajmansa.com/' +'${coachesList.coachimage}',
          placeholder:'images/spinner.gif',
          fit: BoxFit.fill,
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(coachesList.coachname ,
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