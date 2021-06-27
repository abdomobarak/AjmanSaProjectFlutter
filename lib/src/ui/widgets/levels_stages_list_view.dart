import 'package:ajman_app/src/models/levels_stages_json_model.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/levels_stages_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';




Widget buildLevelsStagesList(BuildContext context){
  var levelsStagesProvider = Provider.of<LevelsStagesProvider>(context);

  if(levelsStagesProvider.levelsStagesList == null ){
    return Center(
      child:Image(
        image: AssetImage('images/loader.gif'),
        width: MediaQuery.of(context).size.width *0.6,
      ),
    );
  }else if(levelsStagesProvider.levelsStagesList.length !=0){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
      itemCount: levelsStagesProvider.levelsStagesList.length,
      itemBuilder: (context, index) => levelsStageListItem(context,levelsStagesProvider.levelsStagesList[index]),
    );
  }else {
    return Center(
      child: Text(
          AppLocalizations.of(context).translate('no_data')
      ),
    );
  }

}




levelsStageListItem(BuildContext context, Stages levelsStagesList) {

return   Padding(
  padding: const EdgeInsets.all(8.0),
  child: Center(
    child:Column(
      children: [

        Text(
          levelsStagesList.stagetitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.amiri(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),
        ),

        Divider()
      ],
    )

  ),
);
}