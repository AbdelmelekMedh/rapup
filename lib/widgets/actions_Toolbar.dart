import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapup/Rap_Up_icons_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActionsToolbar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom:10.0),
        width: 100.0,
        child: Column(
            children: [topSection, middleSction,]));
  }

  Widget get topSection =>Container(
    width: 100.0,
    height: 100.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [_getMusicPlayerAction()]),
  );

  Widget get middleSction => Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            elevation: 0,
            backgroundColor:  Colors.transparent,
            onPressed:(){print("FollowAction");} ,
              child: _getFollowAction(),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            elevation: 0,
            backgroundColor:  Colors.transparent,
            onPressed: (){print("socialAction 1");},
              child: _getSocialAction(icon: RapUpIcons.heart, title: '1.6M'),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            elevation: 0,
            backgroundColor:  Colors.transparent,
            onPressed: (){print("socialAction 2");},
              child: _getSocialAction(icon: RapUpIcons.chat_bubble, title: '1.6M'),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            elevation: 0,
            backgroundColor:  Colors.transparent,
            onPressed: (){print("SocialAction 3");},
              child: _getSocialAction(icon: RapUpIcons.reply, title: '', isShare: true),
          ),
        ]
    ),
  );

  Widget _getSocialAction({String title, IconData icon, bool isShare = false}) {
    return Container(
      width: 60.0,
      height: 60.0,
      child: Column(
        children: [
          Icon(icon,size: isShare ? 25.0 : 35.0, color: Colors.grey[300]),
          Padding(padding: EdgeInsets.only(top: isShare ? 5 : 2),
           child: Text(title, style: TextStyle(fontSize: isShare ? 0 : 12)))
        ]
      )
    );
  }

  Widget _getFollowAction(){
    return Container(
      width: 60.0,
      height: 60.0,
      child: Stack( children: [_getProfilePicture()]),
    );
  }


  Widget _getProfilePicture() {
    return Positioned(
        left: (60.0 / 2) - (50.0 / 2),
        child: Container(
            padding: EdgeInsets.all(1.0),
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0 / 2)
            ),
            child: CachedNetworkImage(
              imageUrl: "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
        )
    );
  }

  LinearGradient get musicGradient => LinearGradient(
      colors: [
        Colors.grey[800],
        Colors.grey[900],
        Colors.grey[900],
        Colors.grey[800]
      ],
      stops: [0.0,0.4, 0.6,1.0],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight
  );

  Widget _getMusicPlayerAction() {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(11.0),
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                gradient: musicGradient,
                borderRadius: BorderRadius.circular(50.0 / 2)
            ),
            child: CachedNetworkImage(
              imageUrl: "data:image/png;base64,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",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

        ]));
  }

}
