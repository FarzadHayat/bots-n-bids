import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/rounded_button.dart';
import '../constants.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // create an instance of firebase auth
  final _auth = FirebaseAuth.instance;
  // create a global key for the form widget
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  late String _email;
  late String _password;
  bool showSpinner = false;

  Future<void> _signInWithEmailAndPassword(context) async {
    try {
      // set the loading state
      setState(() {
        showSpinner = true;
      });
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      if (user != null) {
        // navigate to the chat screen
        Navigator.pushNamed(context, HomePage.id);
      }
      // set the loading state
      setState(() {
        showSpinner = false;
      });
      // Do something when the login is successful
      print('Login successful: ${user.user?.uid}');

      // Show success snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      // set the loading state
      setState(() {
        showSpinner = false;
      });
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // Show error snackbar for invalid username or password
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        // Show generic error snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred, please try again later'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print(e);
      // Show generic error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred, please try again later'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: kColorForeground,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner, // set the loading state
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          decoration: const BoxDecoration(
            color: kColorBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Email', style: kTextBody),
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _email = value;
                    },
                    style: kTextBody,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text('Password', style: kTextBody),
                  TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                    ),
                    style: kTextBody,
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
                      onPressed: () async {
                        _signInWithEmailAndPassword(context);
                      },
                      //     () async {
                      //   // set the loading state
                      //   setState(() {
                      //     showSpinner = true;
                      //   });
                      //   // login the user using the signInWithEmailAndPassword method
                      //   try {
                      //     final user = await _auth.signInWithEmailAndPassword(
                      //       email: _email,
                      //       password: _password,
                      //     );
                      //     if (user != null) {
                      //       // navigate to the chat screen
                      //       Navigator.pushNamed(context, HomePage.id);
                      //     }
                      //     // set the loading state
                      //     setState(() {
                      //       showSpinner = false;
                      //     });
                      //   } catch (e) {
                      //     print(e);
                      //   }
                      // },
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
