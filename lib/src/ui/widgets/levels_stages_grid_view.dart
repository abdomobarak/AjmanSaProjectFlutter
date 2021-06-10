

import 'package:ajman_app/src/models/levels_stages_json_model.dart';
import 'package:ajman_app/src/providers/levels_stages_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Widget buildLevelsList(BuildContext context){
   var levelsStagesProvider = Provider.of<LevelsStagesProvider>(context);

   return GridView.builder(
       shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),
       padding: EdgeInsets.all(5),
     itemCount: levelsStagesProvider.levelsStagesList.length,
     itemBuilder: (context, index) => levelStagesListItem(context,levelsStagesProvider.levelsStagesList[index]),
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
         childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ?
         MediaQuery.of(context).size.width /
             (MediaQuery.of(context).size.height / 1.5)
             : MediaQuery.of(context).size.width /
             (MediaQuery.of(context).size.height / 0.3),
       )
   );
}


levelStagesListItem(BuildContext context, Stages levelsStagesList,) {

 return Card(
   elevation: 5,
   child: Text(
       levelsStagesList.leveltitle,
      style: GoogleFonts.amiri(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Color(0xff0e4c53)
      ),
   ),
 );
}