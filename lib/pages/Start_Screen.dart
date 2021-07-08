import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:rapup/widgets/buildSlidingPanel.dart';
import 'package:rapup/widgets/music_icon.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:rapup/widgets/video_Description.dart';

class Start_Screen extends StatefulWidget {

  @override
  _Start_ScreenState createState() => _Start_ScreenState();
}

class _Start_ScreenState extends State<Start_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
        body: SlidingUpPanel(
          color: Colors.white.withOpacity(0.25),
          minHeight: MediaQuery.of(context).size.width - 230,
          panelBuilder: (scrollController) => buildSlidingPanel(
            scrollController: scrollController,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),

          body: Column(
            children:<Widget> [ middleSection ]
          ),
        ),
    );
  }

  Widget get middleSection =>Expanded(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              children: [
                VideoDescription(),
              ],
            ),
            Column(
                children: [
                  MusicIcon(),
                ],
            ),
          ]
      )
  );
}