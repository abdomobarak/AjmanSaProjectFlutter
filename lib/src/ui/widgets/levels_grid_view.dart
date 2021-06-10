import 'package:ajman_app/src/models/levels_json_model.dart';
import 'package:ajman_app/src/providers/levels_provider.dart';
import 'package:ajman_app/src/ui/screens/levels_stages_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


Widget  buildLevelsList(BuildContext context){
  var levelsProvider = Provider.of<LevelsProvider>(context);

  return AnimationLimiter(
    child:  AnimationConfiguration.synchronized(
      duration: const Duration(seconds: 1),
      child: SlideAnimation(
        verticalOffset: 100.0,
        child: FadeInAnimation(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(5),
            itemCount: levelsProvider.levelsList.length,
            itemBuilder: (context, index) => levelsListItem(context ,levelsProvider.levelsList[index] ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
                childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ?
                MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5)
                    : MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 0.3),
              )
          ),
        ),
      ),
    ),
  );
}


levelsListItem(BuildContext context, Levels levelsList) {
  return GestureDetector(
    onTap:(){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LevelsStagesScreen(leveltitle:levelsList.leveltitle),));
    },
    child: Card(
      elevation: 5,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(7),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage('images/swimmer.png'),
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.blue,

              ),
            ),
            Text(
              levelsList.leveltitle,
              style: GoogleFonts.amiri(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0e4c53)
              ),
            ),
          ],
      ),
    ),
  );
}