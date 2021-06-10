
import 'package:ajman_app/src/providers/connectivity_provider.dart';
import 'package:ajman_app/src/providers/levels_stages_provider.dart';
import 'package:ajman_app/src/ui/widgets/levels_stages_list_view.dart';
import 'package:ajman_app/src/ui/widgets/listen_connection_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class LevelsStagesScreen extends StatefulWidget {
  final String leveltitle;
  const LevelsStagesScreen({Key key, this.leveltitle}) : super(key: key);

  @override
  _LevelsStagesScreenState createState() => _LevelsStagesScreenState(this.leveltitle);
}

class _LevelsStagesScreenState extends State<LevelsStagesScreen> {
  final String leveltitle;
  _LevelsStagesScreenState(this.leveltitle);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var levelsStagesProvider = Provider.of<LevelsStagesProvider>(context,listen: false);
    levelsStagesProvider.getLevelsStagesProvider(leveltitle);
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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

                    Text(
                      leveltitle,
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

              buildLevelsStagesList(context),

            ],
          ),
        ),

      ),
    );
  }
}

