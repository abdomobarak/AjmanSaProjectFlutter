
import 'package:ajman_app/src/ui/widgets/contact_bottom_sheet_body.dart';
import 'package:flutter/material.dart';



  contactBottomSheet(BuildContext context){


  return  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
    builder: (context) =>  ContactBody(),

  );

}