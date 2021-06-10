
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/resources/on_board_functions.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';


class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final pageList = [

      PageModel(

        color: const  Color(0xffAAC9CE),
        heroImagePath: 'images/levels.png',
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              AppLocalizations.of(context).translate('subscription'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                  color: Colors.white)
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Text(
              AppLocalizations.of(context).translate('subscription_body'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.white,

              )),
        ),
        icon: Icon(Icons.child_care_sharp,color: Color(0xffb85171)),
        //  iconImagePath: 'images/introduction1.png'
      ),

      PageModel(
        // 0xFF92b7bd
        color: const Color(0xFF92b7bd),
        heroImagePath: 'images/coach.png',
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              AppLocalizations.of(context).translate('coaches'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Colors.white,

              )),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Text(
              AppLocalizations.of(context).translate('coaches_body'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.white,

              )),
        ),
        icon: Icon(Icons.person,color: Colors.blue[500],),
        //iconImagePath: 'images/coach.png'
      ),

      PageModel(
        color: const Color(0xFF5daec1),
        heroImagePath: 'images/offers.png',
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              AppLocalizations.of(context).translate('offers'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Colors.white,

              )),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Text(
              AppLocalizations.of(context).translate('offers_body'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.white,

              )),
        ),
        icon: Icon(Icons.local_offer,color: Color(0xfffc5c1c),),
        //iconImagePath: 'images/coach.png'
      ),

      PageModel(
        color: const Color(0xFF5b97ab),
        heroImagePath: 'images/location.png',
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              AppLocalizations.of(context).translate('location'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Colors.white,

              )),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Text(
              AppLocalizations.of(context).translate('location_body'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.white,
              )),
        ),
        icon: Icon(Icons.location_on,color: Color(0xfff45c5c),),
        // iconImagePath: 'images/coach.png'
      ),



    ];



    return SafeArea(
        child: Scaffold(
          body: FancyOnBoarding(
            doneButtonText: AppLocalizations.of(context).translate('done'),
            skipButtonText:AppLocalizations.of(context).translate('skip'),
            doneButtonBackgroundColor: Color(0xfff45c5c),
            doneButtonTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),

            skipButtonTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),

            pageList: pageList,
            onDoneButtonPressed: () async =>
                goToHome(context),
            onSkipButtonPressed: ()async =>
                goToHome(context),
          ),
        ));
  }
}
