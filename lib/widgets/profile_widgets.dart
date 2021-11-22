import 'package:flutter/material.dart';
import 'package:rapup/common/utils.dart';
import 'package:rapup/models/login_model.dart';
import 'package:rapup/services/shared_service.dart';


Widget profileStats() {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10),
    color: Colors.black,
    height: 100,
    child: Row(
      children: <Widget>[
        Container(
          width: 100,
          child: Align(
            alignment: Alignment.centerLeft,
            child: profileAvatar(
              height: 100,
              width: 100,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget follow({Size screen}){
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10),
    width: screen.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        statsBox(count: '57', title: 'Posts'),
        statsBox(count: '185', title: 'Followers'),
        statsBox(count: '241', title: 'Following'),
      ],
    ),
  );
}

Widget bio(BuildContext context, String username) {
  return Container(
    color: Colors.black,
    width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/3,
    height: MediaQuery.of(context).size.height/10,
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '@${username}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16),
        ),
        Text(
          'Weekend rockclimber and and sketching enthusiast',
          style: TextStyle(color: Colors.white70),
        ),
        /*Text(
          'gyakhoe.com',
          style: TextStyle(color: Colors.pinkAccent),
        ),*/
      ],
    ),
  );
}

Widget editProfile(BuildContext context) {
  return Container(
    color: Colors.black,
    child: Container(
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]),
        borderRadius: BorderRadius.circular(5),
        color: Colors.cyanAccent,
      ),
      child: RaisedButton(
        onPressed: (){},
        color: Colors.transparent,
        elevation: 0,
          child: Text(
            'Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
      ),
    ),
  );
}

Widget followProfile() {
  return Container(
    color: Colors.black,
    child: Container(
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]),
        borderRadius: BorderRadius.circular(5),
        color: Colors.cyanAccent,
      ),
      child: RaisedButton(
        onPressed: (){},
        color: Colors.transparent,
        elevation: 0,
        child: Text(
          'Follow',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    ),
  );
}

Widget messageProfile() {
  return Container(
    color: Colors.black,
    child: Container(
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]),
        borderRadius: BorderRadius.circular(5),
        color: Colors.cyanAccent,
      ),
      child: RaisedButton(
        onPressed: (){},
        color: Colors.transparent,
        elevation: 0,
        child: Text(
          'Message',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    ),
  );
}

Widget statsBox({
  @required String count,
  @required String title,
}) {
  return Container(
    height: 80,
    width: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          count,
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ],
    ),
  );
}

Widget profileAvatar({
  @required double height,
  @required double width,
  bool isStorySeen = false,
}) {
  return Container(
    height: height, //155,
    width: width, //155,
    child: Align(
            alignment: Alignment.center,
            child: Container(
              height: height - 10, //140,
              width: width - 10, //140,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(Utils.getRandomImageUrl()),
              ),
            ),
          ),
  );
}