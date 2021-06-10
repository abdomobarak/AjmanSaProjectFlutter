import 'package:ajman_app/src/models/coach_report_json_model.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/coach_report_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



Widget coachRetportList(BuildContext context){
  var coachReportProvider = Provider.of<CoachReportProvider>(context);
  if(coachReportProvider.coachNotes == null){
    return Center(
      child:Image(
        image: AssetImage('images/loader.gif'),
        width: MediaQuery.of(context).size.width *0.6,
      ),
    );
  }else if(coachReportProvider.coachNotes.length !=0 ){
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: coachReportProvider.coachNotes.length,
        itemBuilder: (context, index) =>coachReportListItem(context,coachReportProvider.coachNotes[index]),
      ),
    );
  }else {
    return Center(
      child: Text(
          AppLocalizations.of(context).translate('no_data')
      ),
    );
    
  }


}

coachReportListItem(BuildContext context, CoachNotes coachNot) {
  return Padding(
      padding: const EdgeInsets.all(10.0),
      child:Column(
        children: [

          ListTile(
            title: Text(
                coachNot.stagetitle,
              style: GoogleFonts.amiri(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
            leading: Text(
                '%'+coachNot.percentage.toString(),
              style: GoogleFonts.amiri(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),),
          ),

          Divider(thickness: 1,)
        ],
      )

  );
}