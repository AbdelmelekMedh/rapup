import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/user.dart';
import 'package:http/http.dart' as http;


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String ValueGender;
  List listGender = ["Male", "Female","Other"];
  DateTime date ;
  User user = User("","",DateTime.now(),"");

  Future save() async {
    var res = await http.post("http://localhost:8080/???",
        headers: {'Context-Type':'application/json'},
        body: json.encode({
          'email': user.email,
          'password': user.password,
          'dateofbirth': user.dateOfBierth.toIso8601String(),
          'gender': user.gender}));
    print(res.body);
    if (res.body != null) {
      Navigator.of(context).pushNamed('/signin');
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
      body: Stack(
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
                        child: Text('Create Account',
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height - 665),//80
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Your email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height - 755),//5
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
                      SizedBox(height: MediaQuery.of(context).size.height - 730),//20
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Create a password',
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
                      SizedBox(height: MediaQuery.of(context).size.height - 730),//20
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text('Data of birth',style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height - 750),//10
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white,width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: FlatButton(
                                      onPressed: (){
                                        setState(() {
                                          SelectDate(context);
                                        });
                                      },
                                      color: Colors.transparent,
                                      child: Row(
                                        children: [
                                          Text( date == null ? 'picke your bierth' : ' ${date.year}/${date.month}/${date.day} ',
                                            style: TextStyle(color: Colors.black54,fontSize: 15),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Icon(FontAwesomeIcons.angleDown,color: Colors.white,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text('Gender',style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height - 750),//10
                                  Container(
                                    padding: EdgeInsets.only(left: 16,right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white,width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: DropdownButton(
                                      hint: Text(' select gender '),
                                      dropdownColor: Colors.white.withOpacity(0.5),
                                      icon: Icon(FontAwesomeIcons.angleDown,color: Colors.white,),
                                      iconSize: 30,
                                      //isExpanded: true,
                                      underline: SizedBox(),
                                      style: TextStyle(color: Colors.black87,fontSize: 15),
                                      value: ValueGender,
                                      onChanged: (newValue){
                                        setState(() {
                                          ValueGender = newValue;
                                          user.gender = newValue;
                                        });
                                      },
                                      items: listGender.map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      )
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height - 730),//40
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width-220,//180
                          height:MediaQuery.of(context).size.height - 715 ,//45
                          child: FlatButton(
                            onPressed: (){
                              if (user.email == null || RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(user.email)){
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
                              } if (user.dateOfBierth == DateTime.now()){
                                Fluttertoast.showToast(
                                    msg: "select yor date of birth",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black54,
                                    textColor: Colors.white,
                                    fontSize: 18.0
                                );
                              } if (user.gender == ""){
                                Fluttertoast.showToast(
                                    msg: "select your gender",
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
                            shape:
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(30),),
                            ),
                            child: Text('DONE',style: TextStyle(fontSize: 18,color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child:
                  Column(
                    children: [
                      Text('By clicking on "Sign up", you accept the ',
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(0.5)),
                      ),
                      Text(' Terms and Conditions of Use',
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(1),decoration: TextDecoration.underline),
                      ),
                    ],
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
  Future<Null> SelectDate (BuildContext context) async{
    DateTime datePicker = await showDatePicker(
        context: context,
        initialDate: date == null ? DateTime.now() : date,
        firstDate: DateTime(1947),
        lastDate: DateTime.now(),
        //initialDatePickerMode: DatePickerMode.year,
        //selectableDayPredicate: (DateTime val) => val.weekday == 6 || val.weekday == 7 ? false : true,
        builder: (BuildContext context,Widget child){
          return Theme(
              data: ThemeData(
                primarySwatch:  buttonColor,
                primaryColor: Colors.black54,
                accentColor: Color(0xFFE7680D),
              ),
              child: child
          );
        }
    );

    user.dateOfBierth = datePicker;
    print(user.dateOfBierth.toString());

    if(datePicker != null && datePicker != date){
      setState(() {
        date = datePicker;
        print(date.toString());
      });
    }
  }
}

const MaterialColor buttonColor = MaterialColor(0xFFE7680D, <int, Color>{
  50: Color(0xFFE7680D),
  100: Color(0xFFE7680D),
  200: Color(0xFFE7680D),
  300: Color(0xFFE7680D),
  400: Color(0xFFE7680D),
  500: Color(0xFFE7680D),
  600: Color(0xFFE7680D),
  700: Color(0xFFE7680D),
  800: Color(0xFFE7680D),
  900: Color(0xFFE7680D),
});