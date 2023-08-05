import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/profile.dart';
import '../database.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static const String id = 'signup_page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final _formkey = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> {
  bool remember = false;
  MemberType memberType = MemberType.Spectator;

  final TextEditingController _textUsername = TextEditingController();
  final TextEditingController _textEmail = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();
  final TextEditingController _textPasswordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bots \'n Bids'),
        backgroundColor: kColorForeground,
      ),
      body: Container(
        decoration: const BoxDecoration(color: kColorButton),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('New Profile', style: kTextHeader),
                    const Text('Member Type', style: kTextBody),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text(
                              'Viewer',
                              style: kTextBody,
                            ),
                            leading: Radio<MemberType>(
                              value: MemberType.Spectator,
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              groupValue: memberType,
                              onChanged: (MemberType? value) {
                                setState(() {
                                  if (value != null) {
                                    memberType = value;
                                  } else {
                                    memberType = MemberType.Spectator;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Judge', style: kTextBody),
                            leading: Radio<MemberType>(
                              value: MemberType.Judge,
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              groupValue: memberType,
                              onChanged: (MemberType? value) {
                                setState(() {
                                  if (value != null) {
                                    memberType = value;
                                  } else {
                                    memberType = MemberType.Spectator;
                                  }
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const Text('Email', style: kTextBody),
                    TextFormField(
                      controller: _textEmail,
                      style: kTextBody,
                      decoration: kTextFieldDecoration,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email required!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Text('Username', style: kTextBody),
                    TextFormField(
                      controller: _textUsername,
                      style: kTextBody,
                      decoration: kTextFieldDecoration,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username required!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Text('Password', style: kTextBody),
                    TextFormField(
                      controller: _textPassword,
                      style: kTextBody,
                      decoration: kTextFieldDecoration,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password required!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Text('Confirm Password', style: kTextBody),
                    TextFormField(
                      controller: _textPasswordConfirm,
                      style: kTextBody,
                      decoration: kTextFieldDecoration,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password again!";
                        } else if (value != _textPassword.text) {
                          return "Passwords do not match";
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
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
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
                            Text(
                              'Forgot?',
                              style: kTextBody,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                String email = _textEmail.text;
                                String username = _textUsername.text;
                                String password = _textPassword.text;
                                String passwordConfirm =
                                    _textPasswordConfirm.text;

                                // Profile? foundUser = findProfileByUsername(username);

                                Globals().addProfile(Profile(
                                    email: email,
                                    name: username,
                                    password: password,
                                    memberType: memberType));

                                if (memberType == MemberType.Spectator) {
                                  Navigator.pushNamed(context, '/bidder_home');
                                } else {
                                  Navigator.pushNamed(context, '/judge_home');
                                }
                              }
                            },
                            child: Card(
                              child: TextButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    String email = _textEmail.text;
                                    String username = _textUsername.text;
                                    String password = _textPassword.text;
                                    String passwordConfirm =
                                        _textPasswordConfirm.text;

                                    // Profile? foundUser = findProfileByUsername(username);

                                    Profile p = Profile(
                                        email: email,
                                        name: username,
                                        password: password,
                                        memberType: memberType);

                                    Globals().addProfile(p);

                                    Globals().login(p);

                                    if (memberType == MemberType.Spectator) {
                                      Navigator.pushNamed(
                                          context, '/bidder_home');
                                    } else {
                                      Navigator.pushNamed(
                                          context, '/judge_home');
                                    }
                                  }
                                },
                                child: const Text(
                                  'SIGN UP',
                                  style: kTextBody,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
