import 'package:bmicalculator/layout/home.dart';
import 'package:flutter/material.dart';
Widget cardIcon ({
  required IconData icon,
  required String text,
  required BuildContext ctx,
  required bool isGender,

}) {

  return Container(
      child: Card(
        color: isGender?Colors.blue:Theme.of(ctx).primaryColor,
        elevation: 8.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(icon),
          Text(text,style: Theme.of(ctx).textTheme.bodyText1,)
        ],),
      ),
    );
  }


Widget cardText  ({
required String textData,
required int show,
required String tag1,
required String tag2,
required Function function1,
required Function function2,
  required BuildContext ctx,
}){
    return Container(
      child: Card(
        color: Theme.of(ctx).primaryColor,
        elevation: 8.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(textData,style: Theme.of(ctx).textTheme.bodyText1,),
            Text(show.toString(),style: Theme.of(ctx).textTheme.bodyText1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.blue,
                  heroTag: tag1,
                  child: Icon(Icons.remove,size: 24,),
                  onPressed:()=> function1.call(),
                ),
                SizedBox(width: 4,),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.blue,
                  heroTag: tag2,
                  child: Icon(Icons.add,size: 24,),
                  onPressed: ()=>function2.call(),
                ),
              ],
            ),

          ],),
      ),
    );
  }
