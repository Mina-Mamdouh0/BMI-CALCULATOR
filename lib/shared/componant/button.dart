import 'package:flutter/material.dart';

class Button extends StatelessWidget {
 final String textButton;
 final Function function;

  const Button({Key? key, required this.textButton, required this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Colors.red,
        child: Text(textButton,style: TextStyle(
          fontSize: 20
        ),),
        onPressed: ()=>function.call(),
    );
  }
}
