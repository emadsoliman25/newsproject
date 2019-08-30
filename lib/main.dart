import 'package:flutter/material.dart';
import 'package:news_app/screens/on_boarding.dart';
import 'screens/submit_screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utilities/app_theme.dart';

main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.get('seen');
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = OnBoarding();
  }else{
    _screen = Login();
  }

  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  final Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: this._screen,
     /* theme: ThemeData(
        backgroundColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.indigo,
        splashColor: Colors.transparent,
        bottomAppBarColor: Colors.transparent,
      ),*/
    );
  }
}
