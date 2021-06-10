
import 'package:flutter/material.dart';



showSnackBar(String message,BuildContext context){
  SnackBar snackBar;
  snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          message,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),
        ),

        // Icon(
        //   snackIcon,
        // size: 25.0,)
      ],
    ),

    backgroundColor: Colors.deepOrange,
    duration: Duration(milliseconds: 3000),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

}



closeKeyboard(BuildContext context){
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}