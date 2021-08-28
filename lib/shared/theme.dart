import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
ThemeData light=ThemeData(
  primaryColor: Colors.blueGrey[300],
  accentColor: Colors.white,
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(
    color: Colors.black,
    size: 90.0
  ),
  buttonTheme: ButtonThemeData(
   textTheme: ButtonTextTheme.accent,
    buttonColor: Colors.red,
    minWidth: double.infinity,
     splashColor: Colors.black,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 25
    ),
    headline1: TextStyle(
      color: Colors.grey[900],
      fontSize: 18,
      fontWeight: FontWeight.bold
    )
  )
);
ThemeData dark=ThemeData(
    primaryColor: Colors.blueGrey[300],
    accentColor: Color(0xFF313335),
    backgroundColor: Color(0xFF313335),
    iconTheme: IconThemeData(
        color: Colors.deepPurple,
        size: 90.0
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
      buttonColor: Colors.red,
      minWidth: double.infinity,
      splashColor: Colors.white,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 25
        ),
        headline1: TextStyle(
            color: Colors.grey[900],
            fontSize: 18,
            fontWeight: FontWeight.bold
        )
    )
);


class ThemeNotifier extends ChangeNotifier{

  final String key='theme';
  late SharedPreferences _pref;
  late bool _lightTheme;


  bool get lightTheme=>_lightTheme;

  ThemeNotifier(){
    _lightTheme=true;
    _loadFormPref();
  }
  toggleTheme() {
    _lightTheme = !_lightTheme;
    _saveToPref();
    notifyListeners();
  }
  _initPref()async{
    if(_pref==null){
      _pref=await SharedPreferences.getInstance();
    }
  }
  _loadFormPref()async{
    await _initPref();
    _lightTheme=_pref.getBool(key) ?? true;
    notifyListeners();
  }
  _saveToPref()async{
    await _initPref();
    _pref.setBool(key, _lightTheme);
  }
}