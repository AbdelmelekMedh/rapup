import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body:Stack(
        children:<Widget> [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF3F2F2),
                  Color(0xFFF93B3B),
                  Color(0xFFE7680D),
                  Color(0xFF8B7C71),
                ],
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Flexible(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 100),
                        Center(
                          child: Text('Log In',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 80),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('Email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextField(decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Icon(
                                      FontAwesomeIcons.envelope,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                  style: TextStyle(color: Colors.black87),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextField(decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Icon(
                                      FontAwesomeIcons.lock,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                  obscureText: true,
                                  style: TextStyle(color: Colors.black87,fontSize: 25),
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: SizedBox(
                            width: 180,
                            height:45 ,
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.of(context).pushNamed('/home');
                                print('let"s go');
                              },
                              color: Colors.transparent,
                              elevation: 0,
                              shape:
                              RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30),),
                              ),
                              child: Text('LET"S GO',style: TextStyle(fontSize: 18,color: Colors.white),),
                            ),
                          ),
                        ),
                        //SizedBox(height: 200),
                      ],
                    ),
                ),
                Center(
                        child:
                        Text("forget password?",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(0.4),decoration: TextDecoration.underline),
                        ),
                      ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
