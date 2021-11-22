import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/models/login_model.dart';
import 'package:rapup/services/shared_service.dart';
import 'package:rapup/user.dart';
import 'package:http/http.dart' as http;
import 'package:rapup/widgets/showMessage.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  User user = User("","","",DateTime.now(),"");

  Future login() async {
    final res = await http.post(Uri.parse("http://10.0.2.2:8080/api/auth/signin"),
        headers: <String, String>{'Content-Type':'application/json'},
        body: json.encode(<String, String>{
          'username': user.userName,
          'password': user.password}));
    if (res.statusCode == 200) {
      LoginResponseModel logResModel = loginResponseModelFormJson(res.body);
      Navigator.of(context).pushNamed('/home',arguments: logResModel);
      if (logResModel.message == ""){
        SharedService.setLoginDetails(logResModel);
        print(logResModel.dateOfBirth);
      }
    }else {
      ShowMessage(context, "login", "invalid username or password", "ok", (){Navigator.of(context).pop;});
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
                        SizedBox(height: MediaQuery.of(context).size.height/6),//100
                        Center(
                          child: Text('Log In',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height/8),//80
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('Username',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/200),//5
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height/15,//50
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: TextEditingController(text: user.userName),
                                  onChanged: (val){
                                    user.userName = val;
                                  },
                                  validator: (value){
                                    if (value.isEmpty){
                                      return 'username is empty';
                                    }
                                    return '';
                                  },
                                  decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Icon(FontAwesomeIcons.user, size: 20, color: Colors.black54,),
                                  ),
                                ),
                                  style: TextStyle(color: Colors.black87),
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/50),//20
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/200),//5
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height/15,//50
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
                        SizedBox(height: MediaQuery.of(context).size.height/20),//40
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width/3,//180
                            height:MediaQuery.of(context).size.height/15,//45
                            child: RaisedButton(
                              onPressed: (){
                                if (user.userName == ""){
                                  return Fluttertoast.showToast(
                                      msg: "check your username",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 18.0
                                  );
                                } if(user.password == ""){
                                  Fluttertoast.showToast(
                                      msg: "check your password",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 18.0
                                  );
                                } return login();
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
                SizedBox(height: MediaQuery.of(context).size.height/80),//40
              ],
            ),
          ),
        ],
      ),
    );
  }
}
