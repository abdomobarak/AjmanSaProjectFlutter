import 'package:ajman_app/src/models/loader_dialog.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/resources/apis/forget_password_api.dart';
import 'package:ajman_app/src/resources/close_keyboard_function.dart';
import 'package:flutter/material.dart';



final formKey = GlobalKey<FormState>();

final userEmailController = TextEditingController();
final GlobalKey<State> loaderDialog = new GlobalKey<State>();



void forgetPasswordAlert(BuildContext context){
  Widget okButton =
  ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
    ),
    child: Text(AppLocalizations.of(context).translate('confirm')),
    onPressed: () {
      if(formKey.currentState.validate()){
        Navigator.of(context).pop();
        LoaderDialog.showLoadingDialog(context, loaderDialog);
        forgetPassword(userEmailController.text.trim(),context);

      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    content: Form(
        key: formKey,
        child: TextFormField(
          controller: userEmailController,
          autofocus: false,
          autocorrect: true,
          cursorColor:Colors.black,
          validator: (value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).translate('empty_field');
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).translate('user_email'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                  color: Color(0xffa73a2f)
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Color(0xffa73a2f)
              ),
            ),
            labelStyle: TextStyle(
              color: Colors.black,
            ),
          ),

        ),
      ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );


}