import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/children_provider.dart';
import 'package:ajman_app/src/ui/widgets/children_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChildrenScreen extends StatelessWidget {
  const ChildrenScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var childrenProvider = Provider.of<ChildrenProvider>(context);
    if(childrenProvider.childreList == null){
      return Center(
        child:Image(
          image: AssetImage('images/loader.gif'),
          width: MediaQuery.of(context).size.width *0.6,
        ),
      );
    }else if(childrenProvider.childreList.length !=0 ){
      return childrenList(context);

    }else {
      return Center(
        child: Text(
            AppLocalizations.of(context).translate('no_data')
        ),
      );
    }
  }
}
