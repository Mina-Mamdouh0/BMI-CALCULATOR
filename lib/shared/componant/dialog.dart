import 'package:flutter/material.dart';

Widget showTheDialog({
  required String content,
  required BuildContext ctx,
}) {
  return AlertDialog(
    backgroundColor: Theme.of(ctx).backgroundColor,
    elevation: 0.0,
    actions: [
      TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text('Ok',
              style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold)))
    ],
    title: Text(
     'Error',
      style: Theme.of(ctx).textTheme.bodyText1,
    ),
    content: Text(
      content,
      style: Theme.of(ctx).textTheme.headline1,
    ),
  );
}
