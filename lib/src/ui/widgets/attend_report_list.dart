import 'package:ajman_app/src/models/attendance_report_json_model.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/attendance_report_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';




Widget attendeReportList(BuildContext context){
  var attendReportProvider = Provider.of<AttendanceReportProvider>(context);
  if(attendReportProvider.attendeReportList == null){
    return Center(
      child:Image(
        image: AssetImage('images/loader.gif'),
        width: MediaQuery.of(context).size.width *0.6,
      ),
    );
  }else if(attendReportProvider.attendeReportList.length != 0){

    return Expanded(
      child: ListView.builder(
        itemCount: attendReportProvider.attendeReportList.length,
        itemBuilder: (context, index) => attendeItemList(context,attendReportProvider.attendeReportList[index]),
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



attendeItemList(BuildContext context, AttendReportJson attendeReportList) {
  return Padding(
      padding: const EdgeInsets.all(10.0),
      child:Column(
        children: [

          ListTile(
            //subtitle: Text('22-11-2021'),
            trailing: Text(
              attendeReportList.attendanceday,
              style: GoogleFonts.amiri(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),

            leading: attendeReportList.attendance == 0?
            Icon(
              Icons.clear,
              size: 30.0,
              color: Colors.deepOrange,
            ):Icon(
              Icons.assignment_turned_in,
              size: 30.0,
              color: Colors.green,
            ),
          ),

          Divider(thickness: 1,)
        ],
      )

  );


}