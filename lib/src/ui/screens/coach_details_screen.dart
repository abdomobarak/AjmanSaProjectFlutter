import 'package:ajman_app/src/models/coaches_json_model.dart';
import 'package:ajman_app/src/ui/widgets/coach_details_body.dart';
import 'package:flutter/material.dart';


class CoachDetailsScreen extends StatelessWidget {
  final Coachs coachesList;
  const CoachDetailsScreen({Key key, this.coachesList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: coachDetailsBody(context,coachesList),
      ),
    );
  }
}
