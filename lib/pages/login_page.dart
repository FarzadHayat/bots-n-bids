import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../constants.dart';
import '../data/profile.dart';
import '../database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formkey = GlobalKey<FormState>();

Profile? findProfileByUsername(String username) {
  try {
    return Globals()
        .getProfiles()
        .firstWhere((profile) => profile.name == username);
  } catch (e) {
    return null;
  }
}

class _LoginPageState extends State<LoginPage> {
  bool remember = false;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: kColorForeground,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: kColorButton,
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
                  const Text('Email', style: kTextBody),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _email = value;
                    },
                    style: kTextBody,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                    ),
                    // validator: (value) {
                    //   String username = _textEmail.text;
                    //   String password = _textPassword.text;
                    //   Profile? foundUser = findProfileByUsername(username);
                    //
                    //   if (value == null || value.isEmpty) {
                    //     return "Username required!";
                    //   } else if (foundUser == null) {
                    //     print('no user exists');
                    //     return "Username or Password is incorrect";
                    //   } else if (foundUser.password != password ||
                    //       widget.memberType != foundUser.memberType) {
                    //     return "Username or Password is incorrect";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text('Password', style: kTextBody),
                  TextFormField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                    ),
                    style: kTextBody,
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
                            fillColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            onChanged: (bool? value) {
                              setState(() {
                                remember = value!;
                              });
                            },
                          ),
                          const Text(
                            'Remember',
                            style: kTextBody,
                          ),
                        ],
                      ),
                      const Row(
                        children: <Widget>[
                          Text('Forgot?', style: kTextBody),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: RoundedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          String email = _email;
                          Profile foundUser = findProfileByUsername(email)!;

                          setState(() {
                            Globals().login(foundUser);

                            // if (widget.memberType == MemberType.Spectator) {
                            //   Navigator.pushNamed(context, '/bidder_home');
                            // } else {
                            //   Navigator.pushNamed(context, '/judge_home');
                            // }
                          });
                        }
                      },
                      color: kColorButton,
                      title: 'LOG IN',
                    ),
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
