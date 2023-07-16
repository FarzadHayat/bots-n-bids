import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/profile.dart';
import '../database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.memberType});

  final MemberType memberType;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formkey = GlobalKey<FormState>();

Profile? findProfileByUsername(String username) {
  try {
    return Globals().getProfiles().firstWhere((profile) => profile.name == username);
  } catch (e) {
    return null;
  }
}

class _LoginPageState extends State<LoginPage> {
  bool remember = false;
  TextEditingController _textUsername = TextEditingController();
  TextEditingController _textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bots \'n Bids'),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Login as ${widget.memberType == MemberType.Spectator ? 'bidder' : 'judge'}',
                      style: kTextBodyHeader),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text('Username', style: kText),
                  TextFormField(
                    controller: _textUsername,
                    style: kTextBlack,
                    decoration: kInputStyle,
                    validator: (value) {
                      String username = _textUsername.text;
                      String password = _textPassword.text;
                      Profile? foundUser = findProfileByUsername(username);

                      if (value == null || value.isEmpty) {
                        return "Username required!";
                      }
                      else if (foundUser == null) {
                        return "Username or Password is incorrect";
                      }
                      else if (foundUser.password != password ||
                      widget.memberType == foundUser.memberType) {
                        return "Username or Password is incorrect";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text('Password', style: kText),
                  TextFormField(
                    controller: _textPassword,
                    decoration: kInputStyle,
                    style: kTextBlack,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password required!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: remember,
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.all<Color>(Colors.white),
                            onChanged: (bool? value) {
                              setState(() {
                                remember = value!;
                              });
                            },
                          ),
                          const Text(
                            'Remember',
                            style: kText,
                          ),
                        ],
                      ),
                      const Row(
                        children: <Widget>[
                          Text('Forgot?', style: kText),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          String username = _textUsername.text;
                          Profile foundUser = findProfileByUsername(username)!;

                          setState(() {
                              Globals().login(foundUser);

                              if (widget.memberType == MemberType.Spectator) {
                                Navigator.pushNamed(context, '/bidder_home');
                              }
                              else {
                                Navigator.pushNamed(context, '/judge_home');
                              }
                            });
                          }

                      },
                      child: const Text(
                        'LOG IN',
                        style: kTextBlack
                      ),
                    ),
        ]
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
