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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text(
                        'LOG IN AS VIEWER',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text(
                        'LOG IN AS JUDGE',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
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
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}