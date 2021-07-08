import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/user.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  User user = User("","",DateTime.now(),"");

  Future save() async {
    var res = await http.post("http://localhost:8080/???",
        headers: {'Context-Type':'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Flexible(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height - 655),//100
                        Center(
                          child: Text('Log In',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height - 665),//80
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('Email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height - 755),//5
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 710,//50
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: TextEditingController(text: user.email),
                                  onChanged: (val){
                                    user.email = val;
                                  },
                                  validator: (value){
                                    if (value.isEmpty){
                                      return 'Email is empty';
                                    }
                                    return '';
                                  },
                                  decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Icon(FontAwesomeIcons.envelope, size: 20, color: Colors.black54,),
                                  ),
                                ),
                                  style: TextStyle(color: Colors.black87),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height - 730),//20
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height - 755),//5
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 710,//50
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: TextEditingController(text: user.password),
                                  onChanged: (val){
                                    user.password = val;
                                  },
                                  validator: (value){
                                    if (value.isEmpty){
                                      return 'Email is empty';
                                    }
                                    return '';
                                  },
                                  decoration: InputDecoration(
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
                        SizedBox(height: MediaQuery.of(context).size.height - 730),//40
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width-220,//180
                            height:MediaQuery.of(context).size.height - 715 ,//45
                            child: RaisedButton(
                              onPressed: (){
                                if (user.email == "" || RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(user.email)){
                                  return Fluttertoast.showToast(
                                      msg: "check your email",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 18.0
                                  );
                                } if(user.password == "" || user.password.length < 7){
                                  Fluttertoast.showToast(
                                      msg: "check your password",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 18.0
                                  );
                                } return save();
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
                        child: InkWell(
                          onTap: (){
                            print("forget password?");
                          },
                          child: Text("forget password?",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.4),
                                decoration: TextDecoration.underline),

                          ),
                        ),
                      ),
                SizedBox(height: MediaQuery.of(context).size.height - 730),//40
              ],
            ),
          ),
        ],
      ),
    );
  }
}
