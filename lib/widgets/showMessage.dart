import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void ShowMessage (
BuildContext context,
    String title,
    String message,
    String buttonText,
    Function onPressed,
){
showDialog(
  context: context,
  builder: (BuildContext context){
    return AlertDialog(
      title: new Text(title),
      content: new Text(message),
      actions: [
        new FlatButton(
            onPressed: (){
              return onPressed();
            },
            child: new Text(buttonText)
        )
      ],
    );
  }
);
}