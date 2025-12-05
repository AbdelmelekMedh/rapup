import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/api/sign_in_api.dart';
import 'package:rapup/models/login_model.dart';
import 'package:rapup/services/shared_service.dart';
import 'package:rapup/widgets/showMessage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final res = await SignInApi.signIn(
      _usernameController.text,
      _passwordController.text,
    );

    if (res.statusCode == 200) {
      LoginResponseModel logResModel = loginResponseModelFromJson(res.body);
      if (logResModel.token.isNotEmpty) {
        await SharedService.setLoginDetails(logResModel);
        if (mounted) {
          Navigator.of(context).pushNamed('/home', arguments: logResModel);
        }
      }
    } else {
      showMessage(context, "Login Error", "Invalid username or password", "OK",
              () => Navigator.of(context).pop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height / 6),
                      const Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 8),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 200),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 15,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              controller: _usernameController,
                              validator: (value) => (value?.isEmpty ?? true)
                                  ? 'Username is required'
                                  : null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              style: const TextStyle(color: Colors.black87),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 200),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 15,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (value) => (value?.isEmpty ?? true)
                                  ? 'Password is required'
                                  : null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Icon(
                                    FontAwesomeIcons.lock,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              obscureText: true,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 25),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 15,
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'LET\'S GO',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      print("forget password?");
                    },
                    child: Text(
                      "forget password?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.4),
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
