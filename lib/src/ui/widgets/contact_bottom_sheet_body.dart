import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/social_provider.dart';
import 'package:ajman_app/src/resources/launch_url_function.dart';
import 'package:ajman_app/src/ui/widgets/contact_item.dart';
import 'package:ajman_app/utils/CustomFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class ContactBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var socialProvider = Provider.of<SocialProvider>(context);
    LatLng mainLocation = const LatLng(25.414171991620158, 55.471508711641555);

    List linksName =['facebook_page','whatsapp' ,'instagram','youtube' ];
    List linksIcons =['images/facebook.png','images/whatsapp.png','images/instagram.png'
      ,'images/youtube.png'];


    if(socialProvider.socialList == null){
      return Center(
        child:Image(
          image: AssetImage('images/loader.gif'),
          width: MediaQuery.of(context).size.width *0.6,
        ),
      );

    }else if(socialProvider.socialList.length == 0){

      return Center(
        child: Text(
            AppLocalizations.of(context).translate('no_data')
        ),
      );
    }
    else {

          return Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.5,

            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [

                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      makeCall(socialProvider.socialList[1].sociallink);
                    },
                    title: Text(
                      AppLocalizations.of(context).translate('call_us'),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff0e4c53)
                      ),
                    ),
                    leading: Icon(
                      Icons.call,
                      size: 30.0,
                      color: Colors.deepOrange,
                    ),
                  ),


                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      CustomFunctions.launchMap(
                          mainLocation.latitude, mainLocation.longitude);
                    },
                    leading: Icon(
                      Icons.location_on,
                      size: 30.0,
                      color: Colors.deepOrange,
                    ),
                    title: Text(
                      AppLocalizations.of(context).translate('location'),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff0e4c53)
                      ),),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: socialProvider.socialList.length,
                    itemBuilder: (context, index) {
                      return ContactItem(
                        index: index,
                        linkIcon: linksIcons[index],
                        linkName: linksName[index],
                      );
                    },
                  ),


                ],
              ),
            ),
          );
    }
  }
}
