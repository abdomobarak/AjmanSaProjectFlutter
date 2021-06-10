import 'package:ajman_app/src/models/children_json_model.dart';
import 'package:ajman_app/src/ui/widgets/children_details_body.dart';
import 'package:flutter/material.dart';


class ChildrenDetailsScreen extends StatelessWidget {
  final Children childrenList;
  const ChildrenDetailsScreen({Key key, this.childrenList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: childrenDetailsBody(context,childrenList),
      ),
    );
  }
}
