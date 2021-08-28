import 'dart:math';

import 'package:bmicalculator/layout/home.dart';
import 'package:bmicalculator/shared/componant/button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final int age;
  final int weight;
  final String gender;
  //double bmi = 0.0;

  ResultScreen(
      {Key? key,
      required this.height,
      required this.age,
      required this.weight,
      required this.gender})
      : super(key: key);

  double result() => weight / pow(height / 100, 2);

  String getResult() {
    if (result() >= 25)
      return 'Over Weight';
    else if (result() >= 18.5)
      return 'Normal';
    else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (result() >= 25)
      return 'You have a higher than normal body weight , try to exercise more ,';
    else if (result() >= 18.5)
      return 'You have normal body weight , good job ';
    else {
      return 'You have a lower than normal body weight , can you eat a bit more ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('BMI-CALCULATOR',style: Theme.of(context).textTheme.bodyText1,),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                'Result',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Gender : $gender'),
                          Text('Age : $age'),
                          Text('${getResult()}'),
                          Text('${getInterpretation()}'),
                          Text('BMI : ${result().toStringAsFixed(3)}'),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Button(
                textButton: 'RE-CALCULATE',
                function: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
                },
              )),
        ],
      ),
    );
  }

}
