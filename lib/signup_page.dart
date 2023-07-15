import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

enum Member { viewer, judge }

class _SignUpPageState extends State<SignUpPage> {
  bool remember = false;
  Member? member = Member.viewer;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('New Profile', style: kTextBodyHeader),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text('Viewer'),
                          leading: Radio<Member>(
                            value: Member.viewer,
                            groupValue: member,
                            onChanged: (Member? value) {
                              setState(() {
                                member = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text('Judge'),
                          leading: Radio<Member>(
                            value: Member.judge,
                            groupValue: member,
                            onChanged: (Member? value) {
                              setState(() {
                                member = value;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email here',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your username here',
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your password here',
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
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
                        Navigator.pushNamed(context, '/home');
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
    );
  }
}
