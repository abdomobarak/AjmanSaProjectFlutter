import 'package:ajman_app/src/models/offers_json_model.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/offers_provider.dart';
import 'package:ajman_app/src/ui/screens/offer_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Widget buildOffersList(BuildContext context){
  var offersProvider = Provider.of<OffersProvider>(context);
  return AnimationLimiter(
    child: AnimationConfiguration.synchronized(
      duration: const Duration(seconds: 1),
      child: SlideAnimation(
        verticalOffset: 100.0,
        child: FadeInAnimation(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(5),
            itemCount: offersProvider.offersList.length,
            itemBuilder: (context, index) => buildOffersListItem(context,offersProvider.offersList[index]),
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



buildOffersListItem(BuildContext context, Offers offersList) {
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => OfferDetailsScreen(offersList:offersList),)
      );
    },
      child: Container(
        padding: EdgeInsets.all(8),
        margin:EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: NetworkImage(
                'https://ajmansa.com/'+offersList.offerimage,),
                fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
          )
        ),
        child: Center(
          child: Text(
              offersList.offerstitle,
              textAlign: TextAlign.center,
            style: GoogleFonts.amiri(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
                color:Color(0xff0e4c53)
            ),
          ),
        ),
      )


      // Column(
      //   children: [
      //
      //     Align(
      //         alignment: Alignment.topRight,
      //         child: Icon(Icons.local_offer, color: Color(0xfffc5c1c))),
      //     Text(AppLocalizations.of(context).translate('monthly'),
      //       style: TextStyle(
      //           fontSize: 20 ,
      //           fontWeight: FontWeight.bold),
      //     ),
      //
      //     Expanded(
      //       child:CircleAvatar(
      //         radius: 70.0,
      //         child: Padding(
      //           padding: EdgeInsets.all(15),
      //           child: Text(
      //             offersList.offerstitle,
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.bold),),
      //         ),
      //         backgroundColor: Color(0xffAAC9CE),
      //       ),
      //     ),
      //
      //   ],
      // ),

  );
}