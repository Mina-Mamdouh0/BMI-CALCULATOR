import 'package:bmicalculator/layout/home.dart';
import 'package:bmicalculator/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context,notifier,child)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BMI',
          theme: notifier.lightTheme?light:dark,
          home: Home(),
        ),
      ),
    );
  }
}


