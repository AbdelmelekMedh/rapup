import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SocialAction extends StatefulWidget {
  @override
  _SocialActionState createState() => _SocialActionState();
}

class _SocialActionState extends State<SocialAction> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "follow",
              elevation: 0,
              backgroundColor:  Colors.transparent,
              onPressed:(){
                print("FollowAction");
              } ,
              child: _getProfilePicture(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height - 750),//10
            FloatingActionButton(
              heroTag: "social 1",
              elevation: 0,
              backgroundColor:  Colors.grey.withOpacity(0.8),
              onPressed: (){
                print("SocialAction 1");
              },
              child: getSocialAction(icon: FontAwesomeIcons.mapMarkerAlt, title: '', isShare: true),
            ),
            SizedBox(height: MediaQuery.of(context).size.height - 750),//10
            FloatingActionButton(
              heroTag: "social 2",
              elevation: 0,
              backgroundColor:  Colors.grey.withOpacity(0.8),
              onPressed: (){
                print("socialAction 2");
              },
              child: getSocialAction(icon: FontAwesomeIcons.solidHeart, title: '1.6M'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height - 750),//10
            FloatingActionButton(
              heroTag: "social 3",
              elevation: 0,
              backgroundColor:  Colors.grey.withOpacity(0.8),
              onPressed: (){
                print("socialAction 3");
              },
              child: getSocialAction(icon: FontAwesomeIcons.solidCommentAlt, title: '1.6M'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height - 750),//10
            FloatingActionButton(
              heroTag: "social 4",
              elevation: 0,
              backgroundColor:  Colors.grey.withOpacity(0.8),
              onPressed: (){
                print("SocialAction 4");
              },
              child: getSocialAction(icon: FontAwesomeIcons.solidCircle, title: '', isShare: true),
            ),
            SizedBox(height: MediaQuery.of(context).size.height - 750),//10
            FloatingActionButton(
              heroTag: "social 5",
              elevation: 0,
              backgroundColor:  Colors.grey.withOpacity(0.8),
              onPressed: (){
                print("SocialAction 5");
              },
              child: getSocialAction(icon: FontAwesomeIcons.shareAlt, title: '', isShare: true),
            ),
          ]
      ),
    );
  }


  Widget getSocialAction({String title, IconData icon, bool isShare = false}) {
    return Container(
        width: 50.0,
        height: 50.0,
        child: Icon(icon,size: 25.0, color: Colors.black),
              /*Padding(padding: EdgeInsets.only(top: 2),
                  child: Text(title, style: TextStyle(fontSize: isShare ? 0 : 12, color: Colors.black))
              )*/
    );
  }

  Widget getFollowAction(){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: 60,
      height: 60,
      child: Stack(
        children: [_getProfilePicture(), _getPlusIcon()],
      ),
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

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((60 / 2) - (20 / 2)),
      child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 79, 205, 247),
              borderRadius: BorderRadius.circular(15.0),
          ),
          child: Icon(Icons.add, color: Colors.black, size: 20.0)
      ),
    );
  }
}


