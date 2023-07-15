import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 60.0,
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
                  const Text('WELCOME', style: kTextBodyHeader),
                  const SizedBox(
                    height: 20.0,
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
                    height: 20.0,
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
                        Navigator.pushNamed(context, '/marksheet');
                      },
                      child: Card(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                              color: Color(0xFF0f1627),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
