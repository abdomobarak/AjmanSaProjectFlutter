
import 'package:ajman_app/src/providers/app_lang.dart';
import 'package:ajman_app/src/providers/attendance_report_provider.dart';
import 'package:ajman_app/src/providers/body_provider.dart';
import 'package:ajman_app/src/providers/check_login_provider.dart';
import 'package:ajman_app/src/providers/children_provider.dart';
import 'package:ajman_app/src/providers/coach_report_provider.dart';
import 'package:ajman_app/src/providers/coaches_provider.dart';
import 'package:ajman_app/src/providers/connectivity_provider.dart';
import 'package:ajman_app/src/providers/levels_provider.dart';
import 'package:ajman_app/src/providers/levels_stages_provider.dart';
import 'package:ajman_app/src/providers/login_provider.dart';
import 'package:ajman_app/src/providers/news_provider.dart';
import 'package:ajman_app/src/providers/offers_provider.dart';
import 'package:ajman_app/src/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BodyProvider>(create: (_) => BodyProvider(),),
        ChangeNotifierProvider<ConnectivityProvider>(create: (_) => ConnectivityProvider(),),
        ChangeNotifierProvider<NewsProvider>(create: (_) => NewsProvider(),),
        ChangeNotifierProvider<CoachesProvider>(create: (_) => CoachesProvider(),),
        ChangeNotifierProvider<LevelsStagesProvider>(create: (_) => LevelsStagesProvider(),),
        ChangeNotifierProvider<LevelsProvider>(create: (_) => LevelsProvider(),),
        ChangeNotifierProvider<OffersProvider>(create: (_) => OffersProvider(),),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider(),),
        ChangeNotifierProvider<ChildrenProvider>(create: (_) => ChildrenProvider(),),
        ChangeNotifierProvider<CoachReportProvider>(create: (_) => CoachReportProvider(),),
        ChangeNotifierProvider<AttendanceReportProvider>(create: (_) => AttendanceReportProvider(),),
        ChangeNotifierProvider<CheckLoginProvider>(create: (_) => CheckLoginProvider(),),




      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, navigator) {
            var lang = Localizations.localeOf(context).languageCode;

            return Theme(
              data: ThemeData(
                brightness: Brightness.light,
                primaryColor:Colors.white,
                accentColor: Colors.blue,
                fontFamily:lang == 'ar'?
                GoogleFonts.amiri().fontFamily : GoogleFonts.aclonica().fontFamily,
              ),
              child: navigator,
            );
          },
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar', 'EG'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home:SplashScreen()
      ),
    );
  }
}
