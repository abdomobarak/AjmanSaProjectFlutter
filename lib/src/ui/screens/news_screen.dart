

import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/news_provider.dart';
import 'package:ajman_app/src/ui/widgets/news_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);

    if(newsProvider.reversedNewsList == null){
      return Center(
        child:Image(
          image: AssetImage('images/loader.gif'),
          width: MediaQuery.of(context).size.width *0.6,
        ),
      );
    }else if(newsProvider.reversedNewsList.length != 0){
      return buildNewsList(context);
    }else {
      return Center(
        child: Text(
          AppLocalizations.of(context).translate('no_data')
        ),
      );
    }
  }




}
