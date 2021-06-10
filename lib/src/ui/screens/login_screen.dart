import 'package:ajman_app/src/models/loader_dialog.dart';
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/login_provider.dart';
import 'package:ajman_app/src/resources/close_keyboard_function.dart';
import 'package:ajman_app/src/ui/widgets/forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<State> loaderDialog = new GlobalKey<State>();



  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);

    return Column(

      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage('images/splash.png'),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: userNameController,
                    autofocus: false,

                    cursorColor:Colors.black,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context).translate('empty_field');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate('user_name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    autofocus: false,
                    obscureText: true,

                    cursorColor:Colors.black,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context).translate('empty_field');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate('user_password'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: (){
                if(formKey.currentState.validate()){
                  closeKeyboard(context);
                  LoaderDialog.showLoadingDialog(context, loaderDialog);
                  loginProvider.checkUser(
                      userNameController.text.trim(),
                     passwordController.text.trim(),
                      context
                  );

                }
              },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.deepOrange)
                  )
              ),
              backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
            ),
            child: Text(
            AppLocalizations.of(context).translate('login'),
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white
            ),
          ),
          ),
        ),



        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => forgetPasswordAlert(context),
            child: Text(
              AppLocalizations.of(context).translate('forget_password'),
              style: TextStyle(
                fontSize: 18.0,
                  color:Color(0xff0e4c53)
              ),

            ),
          ),
        )

      ],
    );
  }
}
