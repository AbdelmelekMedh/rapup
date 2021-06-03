import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String ValueGender;
  List listGender = ["Male", "Female","Other"];
  DateTime date ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        child: Text('Create Account',
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Your email',
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
                        child: Text('Create a password',
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
                      SizedBox(height: 20),
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
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white,width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: FlatButton(
                                      //elevation: 0,
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
                            //SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text('Gender',style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                  SizedBox(height: 10),
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
                                      style: TextStyle(
                                          color: Colors.black87,fontSize: 15
                                      ),
                                      value: ValueGender,
                                      onChanged: (newValue){
                                        setState(() {
                                          ValueGender = newValue;
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
                      SizedBox(height: 40),
                      Center(
                        child: SizedBox(
                          width: 180,
                          height:45 ,
                          child: FlatButton(
                            onPressed: (){
                              print('done');
                            },
                            color: Colors.transparent,
                            //elevation: 0,
                            shape:
                            RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(30),),
                            ),
                            child: Text('DONE',style: TextStyle(fontSize: 18,color: Colors.white),),
                          ),
                        ),
                      ),
                      //SizedBox(height: 200),
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
                SizedBox(height: 40),
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