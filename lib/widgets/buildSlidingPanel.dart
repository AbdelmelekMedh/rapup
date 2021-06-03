import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class buildSlidingPanel extends StatelessWidget {

  const buildSlidingPanel({
    Key key,
    @required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.transparent,
    body: ListView(
        controller: scrollController,
        padding: EdgeInsets.zero,
        children:<Widget> [
          SizedBox(height: 15),
          buildTabBar(),
         SizedBox(height: 40,),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
                width: 300,
                height:50 ,
                child: RaisedButton(
                  onPressed: (){
                  print('button facebook');
                  },
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Icon(FontAwesomeIcons.facebook,color: Colors.white,size: 35,),
                    SizedBox(width: 25),
                    Text("Sign up with Facebook",style: TextStyle(fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              SizedBox(
                width: 300,
                height:50 ,
                child: RaisedButton(
                  onPressed: (){
                  print('button google');
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.google,size: 30,),
                      SizedBox(width: 25),
                      Text("Sign up with Google",style: TextStyle(fontSize: 18,color: Colors.black),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 300,
                height:50 ,
                child: RaisedButton(
                  onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    Navigator.of(context).pushNamed('/signup',);
                    print('button Mail');
                  },
                  color: Colors.transparent,
                  elevation: 0,
                  shape:
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30),),
                  ),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.mailBulk,size: 30,color: Colors.white,),
                      SizedBox(width: 25),
                      Text("Sign up with Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20,),
                  Text("Already have an account?",style: TextStyle(fontSize: 16,color: Colors.white70)),
                  SizedBox(width: 10,),
                  FlatButton(
                    onPressed: (){
                      //Navigator.push(context, new MaterialPageRoute(builder: (context) => SignIn()));
                      Navigator.of(context).pushNamed('/signin');
                      print("log in");
                    },
                    child: Text("Log In",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ],
              ),
              ],
            ),
          ),
        ],
    ),
  );

}

Widget buildTabBar()=> Center(
  child: Container(
    child: buildDragIcon(),//Icon(Icons.arrow_drop_up,color: Colors.black.withOpacity(0.3),),
  ),
);

Widget buildDragIcon() => Container(
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.3),
    borderRadius: BorderRadius.circular(8),
  ),
  width: 80,
  height: 8,
);