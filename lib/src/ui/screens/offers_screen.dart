import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/offers_provider.dart';
import 'package:ajman_app/src/ui/widgets/offers_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class OffersScreen extends StatelessWidget {
  const OffersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var offersProvider = Provider.of<OffersProvider>(context);
    if(offersProvider.offersList == null){
      return Center(
        child:Image(
          image: AssetImage('images/loader.gif'),
          width: MediaQuery.of(context).size.width *0.6,
        ),
      );
    }else if(offersProvider.offersList.length !=0 ){
      return buildOffersList(context);
    }else {
      return Center(
        child: Text(
            AppLocalizations.of(context).translate('no_data')
        ),
      );
    }
  }
}
