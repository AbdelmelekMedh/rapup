import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rapup/api/sign_up_api.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final res = await SignUpApi.signUp(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
    );

    print(res.body);
    if (res.statusCode == 200 && mounted) {
      Navigator.of(context).pushNamed('/signin');
    } else if (mounted) {
      final body = json.decode(res.body);
      final errors = body['errors'];
      if (errors != null && errors is Map) {
        final messages =
            errors.values.expand((e) => e as List).join('\n');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(messages)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(body['message'] ?? 'An unknown error occurred.')),
        );
      }
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
            child: Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height / 8),
                        const Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 20),
                        const Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 5),
                          child: Text(
                            'Username',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: _usernameController,
                            validator: (value) =>
                                (value?.isEmpty ?? true) ? 'Username is required' : null,
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
                        SizedBox(height: MediaQuery.of(context).size.height / 50),
                        const Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 5),
                          child: Text(
                            'Your email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) =>
                                (value?.isEmpty ?? true) ? 'Email is required' : null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            style: const TextStyle(color: Colors.black87),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 50),
                        const Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 5),
                          child: Text(
                            'Create a password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 20),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 15,
                            child: ElevatedButton(
                              onPressed: save,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
