
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/check_login_provider.dart';
import 'package:ajman_app/src/resources/set_body_function.dart';
import 'package:ajman_app/src/resources/set_logout_loader_function.dart';
import 'package:ajman_app/src/ui/widgets/powered_by_daem_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




myDrawer(BuildContext context) {

  return Container(
    decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    width: MediaQuery.of(context).size.width * 0.7,
    child: ListView(
      children: [

        Padding(
          padding: EdgeInsets.all(13),
          child: Center(
            child: Image(
              image: AssetImage('images/splash.png'),
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
        ),

        Divider(),

        drawerList(context),


        Divider(),



        poweredByWidget(context),




      ],
    ),

  );
}





drawerList(BuildContext context) {
  var checkLoginProvider = Provider.of<CheckLoginProvider>(context);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ListTile(
          onTap: (){
            setMainBody(0, context);
          },
          leading: Icon(
              Icons.home ,
              size: 30.0,
              color:Colors.deepOrange),
          title: Text(
            AppLocalizations.of(context).translate('home'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ),


        ListTile(
          onTap: (){
            setMainBody(1, context);
          },
          leading: Icon(
              Icons.person ,
              size: 30.0,
              color:Colors.deepOrange),
          title: Text(
            AppLocalizations.of(context).translate('academiy_subscribers'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ),


        ListTile(
          onTap: (){
            setMainBody(2, context);

          },
          leading: ImageIcon(
            AssetImage('images/coach.png'),
            color: Colors.deepOrange,
          ),
          title: Text(
            AppLocalizations.of(context).translate('coaches'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ),

        ListTile(
          onTap: (){
            setMainBody(3, context);

          },
          leading: ImageIcon(
            AssetImage('images/levels.png'),
            color: Colors.deepOrange,
          ),
          title: Text(
            AppLocalizations.of(context).translate('levels'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ),

        ListTile(
          onTap: (){
            setMainBody(4, context);

          },
          leading: Icon(
            Icons.local_offer,
            color: Colors.deepOrange,
          ),
          title: Text(
            AppLocalizations.of(context).translate('offers'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ),

        ListTile(
          onTap: (){
            setMainBody(5, context);

          },
          leading: Icon(
            Icons.contact_phone_sharp,
            color: Colors.deepOrange,
          ),
          title: Text(
            AppLocalizations.of(context).translate('contact_us'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ),

        ListTile(
          onTap: (){
            setMainBody(6, context);

          },
          leading: Icon(
            Icons.location_on,
            color: Colors.deepOrange,
          ),
          title: Text(
            AppLocalizations.of(context).translate('location'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ),

        checkLoginProvider.user == null || checkLoginProvider.user == ''?

            //login user
        ListTile(
          onTap: (){
            setMainBody(1, context);

          },
          leading: Icon(
            Icons.login,
            color: Colors.deepOrange,
          ),
          title: Text(
            AppLocalizations.of(context).translate('login'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ):
            //logout user
        ListTile(
          onTap: (){
            setLogoutLoader(context);

          },
          leading: Icon(
            Icons.logout,
            color: Colors.deepOrange,
          ),
          title: Text(
            AppLocalizations.of(context).translate('logout'),
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff0e4c53)
            ),),
        ),


      ],
    ),
  );
}









