
import 'package:ajman_app/src/models/coaches_json_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget coachDetailsBody(BuildContext context, Coachs coachesList){

  return Column(
    children: [
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


            SizedBox(width: MediaQuery.of(context).size.width / 20,)

          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage.assetNetwork(
            image: 'https://ajmansa.com/' +'${coachesList.coachimage}',
            placeholder:'images/spinner.gif',
            fit: BoxFit.fill,
          ),
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


      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          coachesList.coachbio ,
          textAlign: TextAlign.center,
          style: GoogleFonts.amiri(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color:Color(0xff0e4c53)
          ),),
      ),




    ],
  );
}