
import 'package:ajman_app/src/providers/body_provider.dart';
import 'package:ajman_app/src/providers/connectivity_provider.dart';
import 'package:ajman_app/src/ui/widgets/drawer_widget.dart';
import 'package:ajman_app/src/ui/widgets/listen_connection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {


  GlobalKey<ScaffoldState> drawerKey = GlobalKey();


  @override
  void dispose() {
    // TODO: implement dispose
    var connectivityProvider = Provider.of<ConnectivityProvider>(context,listen: false);
    connectivityProvider.connectivitySubscription.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return SafeArea(
      child: Scaffold(
        key: drawerKey,
        drawer: myDrawer(context),
        body: buildHomeBody(),
      ),
    );
  }




  buildHomeBody() {
    var bodyWidgetProvider = Provider.of<BodyProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu,color: Colors.blue,),
                  iconSize: 30,
                  onPressed: () => drawerKey.currentState.openDrawer(),
                ),


                Image(
                    height: MediaQuery.of(context).size.height / 15.0,
                    image: AssetImage('images/ajman.png')),




              ],
            ),
          ),


          listenConnection(context, bodyWidgetProvider.bodyWidget)


        ],
      ),
    );
  }







}
