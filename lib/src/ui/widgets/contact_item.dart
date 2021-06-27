import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/social_provider.dart';
import 'package:ajman_app/src/resources/launch_url_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ContactItem extends StatelessWidget {

  final int index;
  final String linkIcon;
  final String linkName;

  const ContactItem({Key key, this.index, this.linkIcon, this.linkName}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var socialProvider = Provider.of<SocialProvider>(context);

    return ListTile(
        onTap: () {
          Navigator.of(context).pop();
          socialProvider.socialList[index].socialname == 'whatsapp'?
              launchURL('https://api.whatsapp.com/send/?phone=${socialProvider.socialList[index].sociallink}&text&app_absent=0'):
                 launchURL(socialProvider.socialList[index].sociallink);
        },
        title: Text(
          AppLocalizations.of(context).translate(linkName),
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xff0e4c53)
          ),
        ),
        leading: Image(
          image: AssetImage(linkIcon),
          width: MediaQuery
              .of(context)
              .size
              .width * 0.1,
        )
    );
  }
}
