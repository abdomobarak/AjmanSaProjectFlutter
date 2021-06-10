import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/coaches_provider.dart';
import 'package:ajman_app/src/ui/widgets/coaches_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CoachesScreen extends StatelessWidget {
  const CoachesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coachesProvider = Provider.of<CoachesProvider>(context);
    if(coachesProvider.coachesList == null){
      return Center(
        child:Image(
          image: AssetImage('images/loader.gif'),
          width: MediaQuery.of(context).size.width *0.6,
        ),
      );
    }else if(coachesProvider.coachesList.length !=0){
      return buildCoachesList(context);

    } else {
      return Center(
        child: Text(
            AppLocalizations.of(context).translate('no_data')
        ),
      );
    }
  }
}
