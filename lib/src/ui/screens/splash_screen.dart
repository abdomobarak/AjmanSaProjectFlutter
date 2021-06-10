import 'dart:async';

import 'package:ajman_app/src/providers/check_login_provider.dart';
import 'package:ajman_app/src/ui/screens/home_screen.dart';
import 'package:ajman_app/src/ui/screens/on_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  SharedPreferences logindata;
  bool newUser ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var checkUserLogin = Provider.of<CheckLoginProvider>(context,listen:false);
    checkUserLogin.checkUserLogin();
    checkIfAlreadyLogin();
  }




  checkIfAlreadyLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = (logindata.getBool('ajmanLogined') ?? true);
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) => newUser ? OnboardScreen() : HomeScreen()))
    );
  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.white,
                Color(0xffAAC9CE)
              ],
            ),
          ),
          child: Center(

              child: Image(
                image: AssetImage('images/splash.png'),)

          ),
        ),
      ),
    );
  }
}
