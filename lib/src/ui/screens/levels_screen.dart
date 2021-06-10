import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/levels_provider.dart';
import 'package:ajman_app/src/ui/widgets/levels_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var levelsProvider = Provider.of<LevelsProvider>(context);
    if(levelsProvider.levelsList ==  null){
      return Center(
        child:Image(
          image: AssetImage('images/loader.gif'),
          width: MediaQuery.of(context).size.width *0.6,
        ),
      );
    }else if(levelsProvider.levelsList.length !=0 ){
      return buildLevelsList(context);
    }else {
      return Center(
        child: Text(
            AppLocalizations.of(context).translate('no_data')
        ),
      );
    }
  }
}
