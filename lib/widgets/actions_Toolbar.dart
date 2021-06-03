import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
            onPressed:(){
              Fluttertoast.showToast(
                  msg: " you have to log in first",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 18.0
              );
              print("FollowAction");
              } ,
              child: _getFollowAction(),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            elevation: 0,
            backgroundColor:  Colors.transparent,
            onPressed: (){
              Fluttertoast.showToast(
                  msg: " you have to log in first",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 18.0
              );
              print("socialAction 1");
              },
              child: _getSocialAction(icon: RapUpIcons.heart, title: '1.6M'),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            elevation: 0,
            backgroundColor:  Colors.transparent,
            onPressed: (){
              Fluttertoast.showToast(
                  msg: " you have to log in first",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 18.0
              );
              print("socialAction 2");
              },
              child: _getSocialAction(icon: RapUpIcons.chat_bubble, title: '1.6M'),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            elevation: 0,
            backgroundColor:  Colors.transparent,
            onPressed: (){
              Fluttertoast.showToast(
                  msg: " you have to log in first",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 18.0
              );
              print("SocialAction 3");
              },
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
              imageUrl: "https://icon-library.com/images/song-icon-png/song-icon-png-13.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

        ]));
  }

}
