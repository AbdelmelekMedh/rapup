import 'package:flutter/material.dart';
import 'package:rapup/widgets/music_icon.dart';
import 'package:rapup/widgets/social_action.dart';
import 'package:rapup/widgets/video_Description.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
        body: Column(
            children:<Widget> [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: [
                        VideoDescription(),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 293,//100
                      child: Column(
                        children: [
                          MusicIcon(),
                          SocialAction(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
    );
  }
}
