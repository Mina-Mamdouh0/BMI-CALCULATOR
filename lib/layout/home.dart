import 'dart:math';

import 'package:bmicalculator/module/resultscreen.dart';
import 'package:bmicalculator/shared/componant/button.dart';
import 'package:bmicalculator/shared/componant/cards.dart';
import 'package:bmicalculator/shared/componant/dialog.dart';
import 'package:bmicalculator/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height = 120.0;
  int age = 20;
  int weight = 80;
  bool male = true, female = false;
  String gender = 'Male';
  late double bmi;

  String result() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'BMI-CALCULATOR',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          Consumer<ThemeNotifier>(
              builder: (BuildContext context, notifier, child) =>IconButton(
            onPressed: ()=>notifier.toggleTheme(),
            icon: notifier.lightTheme?Icon(Icons.dark_mode):Icon(Icons.light_mode,color: Colors.white,),
          ))
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              male = true;
                              female = false;
                              gender = 'Male';
                            });
                          },
                          child: cardIcon(
                            icon: Icons.male,
                            text: 'Male',
                            ctx: context,
                            isGender: male,
                          ))),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        female = true;
                        male = false;
                        gender = 'Female';
                      });
                    },
                    child: cardIcon(
                        icon: Icons.female,
                        text: 'Female',
                        ctx: context,
                        isGender: female),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Height',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.toInt()}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'CM',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Slider(
                          min: 50,
                          max: 250,
                          inactiveColor: Colors.amber,
                          divisions: 200,
                          autofocus: true,
                          value: height,
                          onChanged: (val) {
                            setState(() {
                              height = val;
                            });
                          },
                        ),
                      ],
                    )),
              )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                      child: cardText(
                    textData: 'Weight',
                    show: weight,
                    tag1: 'tag1',
                    tag2: 'tag2',
                    function1: () {
                      if (weight <= 50) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => showTheDialog(
                                ctx: context,
                                content: 'You can\'t lose weight any more'));
                      } else {
                        setState(() {
                          weight--;
                        });
                      }
                    },
                    function2: () {
                      if (weight > 250) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => showTheDialog(
                                ctx: context,
                                content:
                                    'You cannot gain more weight than that'));
                      } else {
                        setState(() {
                          weight++;
                        });
                      }
                    },
                    ctx: context,
                  )),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: cardText(
                          textData: 'Age',
                          show: age,
                          tag1: 'tag3',
                          tag2: 'tag4',
                          function1: () {
                            if (age < 10) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      showTheDialog(
                                          ctx: context,
                                          content:
                                              'You can\'t lose age any more'));
                            } else {
                              setState(() {
                                age--;
                              });
                            }
                          },
                          function2: () {
                            if (age > 100) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) => showTheDialog(
                                      ctx: context,
                                      content:
                                          'You cannot gain more age than that'));
                            } else {
                              setState(() {
                                age++;
                              });
                            }
                          },
                          ctx: context)),
                ],
              ),
            ),
          ),
          Expanded(
              child: Button(
            textButton: 'CALCULATE',
            function: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ResultScreen(
                        height: height,
                        age: age,
                        gender: gender,
                        weight: weight,
                      )));
            },
          ))
        ],
      ),
    );
  }
}
