import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:rapup/widgets/actions_Toolbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:rapup/widgets/video_Description.dart';

class Home extends StatelessWidget {

  final panelController = PanelController();

  Widget get middleSection =>Expanded(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[VideoDescription(), ActionsToolbar()]
      )
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
        body: Column(
            children:<Widget> [ middleSection ]
        ),

    );
  }
}