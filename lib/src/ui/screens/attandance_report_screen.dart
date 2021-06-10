import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/attendance_report_provider.dart';
import 'package:ajman_app/src/ui/widgets/attend_report_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AttendanceReportScreen extends StatefulWidget {
  final String childID;
  const AttendanceReportScreen({Key key, this.childID}) : super(key: key);

  @override
  _AttendanceReportScreenState createState() => _AttendanceReportScreenState(this.childID);
}

class _AttendanceReportScreenState extends State<AttendanceReportScreen> {
  final String childID;
  _AttendanceReportScreenState(this.childID);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var attendeReportProvider = Provider.of<AttendanceReportProvider>(context,listen:false);
    attendeReportProvider.attendeReport(childID);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
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
                        AppLocalizations.of(context).translate('attendance_report'),
                        style: TextStyle(
                            fontSize: 20.0,
                            color:Color(0xff0e4c53)
                        ),
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width / 20,)

                    ],
                  ),
                ),

                attendeReportList(context),
              ]

          )

      ),
    );
  }
}
