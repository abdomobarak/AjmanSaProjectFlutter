import 'package:ajman_app/src/models/offers_json_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



Widget OfferDetailsBody(BuildContext context, Offers offersList){
  return SingleChildScrollView(
    child: Column(
      children:[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon:Icon(Icons.arrow_back_ios)
              ),

              Text(
                offersList.offerstitle,
                style: GoogleFonts.amiri(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                    color:Color(0xff0e4c53)
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 20,)

            ],
          ),
        ),

       CircleAvatar(
            radius: 70.0,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                offersList.offerssubtitle == null || offersList.offerssubtitle.isEmpty ?
                'لايوجد ':offersList.offerssubtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
            ),
            backgroundColor: Color(0xffAAC9CE),
          ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            offersList.offersdescription,
            textAlign: TextAlign.center,
            style: GoogleFonts.amiri(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        )



      ]

    ),
  );

}