import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/profile.dart';
import '../database.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final _formkey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage> {
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
        backgroundColor: kSecondaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text('New Profile', style: kTextBodyHeader),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text('Member Type'),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text('Viewer'),
                            leading: Radio<MemberType>(
                              value: MemberType.Spectator,
                              groupValue: memberType,
                              onChanged: (MemberType? value) {
                                setState(() {
                                  if (value != null) {
                                    memberType = value;
                                  }
                                  else {
                                    memberType = MemberType.Spectator;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Judge'),
                            leading: Radio<MemberType>(
                              value: MemberType.Judge,
                              groupValue: memberType,
                              onChanged: (MemberType? value) {
                                setState(() {
                                  if (value != null) {
                                    memberType = value;
                                  }
                                  else {
                                    memberType = MemberType.Spectator;
                                  }
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const Text('Email'),
                    TextFormField(
                      controller: _textEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email required!";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text('Username'),
                    TextFormField(
                      controller: _textUsername,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username required!";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text('Password'),
                    TextFormField(
                      controller: _textPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password required!";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text('Confirm Password'),
                    TextFormField(
                      controller: _textPasswordConfirm,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password again!";
                        }
                        else if (value != _textPassword.text) {
                          return "Passwords do not match";
                        }
                        else {
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
                              onChanged: (bool? value) {
                                setState(() {
                                  remember = value!;
                                });
                              },
                            ),
                            const Text(
                              'Remember',
                            ),
                          ],
                        ),
                        const Row(
                          children: <Widget>[
                            Text('Forgot?'),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            String email = _textEmail.text;
                            String username = _textUsername.text;
                            String password = _textPassword.text;
                            String passwordConfirm = _textPasswordConfirm.text;

                            // Profile? foundUser = findProfileByUsername(username);

                            Globals().addProfile(Profile(
                              email: email,
                              name: username,
                              password: password,
                              memberType: memberType
                            ));
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        child: Card(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Color(0xFF0f1627),
                              ),
                            ),
                          ),
                        ),
                      ),
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
