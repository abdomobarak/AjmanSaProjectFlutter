import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/coach_report_provider.dart';
import 'package:ajman_app/src/ui/widgets/coach_report_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CoachReportScreen extends StatefulWidget {
  final String childID;
  const CoachReportScreen({Key key, this.childID}) : super(key: key);


  @override
  _CoachReportScreenState createState() => _CoachReportScreenState(this.childID);
}

class _CoachReportScreenState extends State<CoachReportScreen> {
  final String childID;
  _CoachReportScreenState(this.childID);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var coachReportProvider = Provider.of<CoachReportProvider>(context,listen:false);
    coachReportProvider.coachRepportList(childID);
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
                    AppLocalizations.of(context).translate('trainer_notes'),
                    style: TextStyle(
                      fontSize: 20.0,
                        color:Color(0xff0e4c53)
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width / 20,)

                ],
              ),
            ),

            coachRetportList(context),
          ]

        )

      ),
    );
  }

}


