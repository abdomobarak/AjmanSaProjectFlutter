import 'package:ajman_app/src/models/children_json_model.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/ui/screens/attandance_report_screen.dart';
import 'package:ajman_app/src/ui/screens/coach_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


Widget childrenDetailsBody(BuildContext context, Children childrenList){
  final dateFormat = new DateFormat('yyyy-MM-dd');
  return SingleChildScrollView(
    child: Column(
      children: [

        Padding(
          padding: const EdgeInsets.all(5.0),
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

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                childrenList.studentname ,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color:Color(0xff0e4c53)
                ),),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              padding: EdgeInsets.all(5),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: FadeInImage.assetNetwork(
                  image: 'https://ajmansa.com/' +'${childrenList.studentimage}',
                  placeholder:'images/spinner.gif',
                  fit: BoxFit.fill,
                ),
              ),
            ),


          ],
        ),



         ListTile(
              trailing: Icon(
                Icons.person,
                size: 30.0,
                color: Colors.deepOrange,
              ),
              title:   Text(
                childrenList.studentgender ,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color:Color(0xff0e4c53)
                ),),
        ),
         ListTile(
              trailing: Icon(
                Icons.child_care,
                size: 30.0,
                color: Colors.deepOrange,
              ),
              title:   Text(
                dateFormat.format(childrenList.studentbirthDate),
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color:Color(0xff0e4c53)
                ),),

        ),
         ListTile(
              trailing: ImageIcon(
              AssetImage('images/swimmer.png'),
                size: 30.0,
                color: Colors.deepOrange,
              ),
              title:   Text(
                childrenList.studentlevel ,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color:Color(0xff0e4c53)
                ),),


        ),
         ListTile(
              trailing: ImageIcon(
                AssetImage('images/coach.png'),
                size: 30.0,
                color: Colors.deepOrange,
              ),
              title:   Text(
                childrenList.studentcoach ,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color:Color(0xff0e4c53)
                ),),


        ),
         ListTile(
              trailing: Icon(
                Icons.date_range,
                size: 30.0,
                color: Colors.deepOrange,
              ),
              title:   Text(
                dateFormat.format(childrenList.studentjoindate) ,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color:Color(0xff0e4c53)
                ),),


        ),
         ListTile(
              trailing: Icon(
                Icons.group,
                size: 30.0,
                color: Colors.deepOrange,
              ),
              title:   Text(
                childrenList.studentgroup ,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color:Color(0xff0e4c53)
                ),),


        ),
         ListTile(
              trailing: Icon(
                  Icons.location_on,
                size: 30.0,
                color: Colors.deepOrange,
              ),
              title:   Text(
                childrenList.studentaddress ,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color:Color(0xff0e4c53)
                ),),


        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [

              Expanded(
                child:  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.deepOrange)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                    ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                AttendanceReportScreen(childID:childrenList.studentid.toString()),));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              AppLocalizations.of(context).translate('attendance_report'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                          ),
                        ),),
                  ),
                ),
              ),

              Expanded(
                child:  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:  ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.deepOrange)
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                      ),
                        onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CoachReportScreen(childID:childrenList.studentid.toString()),));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppLocalizations.of(context).translate('trainer_notes'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                          ),
                        ),),
                    ),
                  ),
                ),

            ],
          ),
        )





      ],
    ),
  );
}