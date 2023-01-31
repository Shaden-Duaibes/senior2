import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:senior/enters/sign_up.dart';
import 'package:senior/mainPage.dart';
import 'dart:async';

import '../mainPage.dart';
import 'auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const LoginDemo(),
      ),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _nameController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  String _email = '';
  String _password = '';
  bool _isObscure = true;
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  Widget build(BuildContext context) {
    final TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(color: Color.fromARGB(255, 62, 127, 66));
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Login'),
              backgroundColor: Color.fromARGB(255, 62, 127, 66),
              leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Form(
              key: _formKey,
              //padding: const EdgeInsets.all(10),
              child:
                  ListView(scrollDirection: Axis.vertical, children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR50I3iGVsvcTlR8sAq8Al-HaFgEJdEC5o-_rjiJPLehnTsFZBUDtqWAtLbfBxRdTxAKas&usqp=CAU',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover),
                ),
                Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Color.fromARGB(255, 62, 127, 66),
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  // color: Colors.green,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _email = value.toString();
                      });
                      validateEmail(String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter mail';
                        }
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = RegExp(pattern.toString());
                        if (!regex.hasMatch(value.toString())) {
                          return 'Enter Valid Email';
                        } else {
                          return null;
                        }
                      }
                    },

                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.contact_mail),
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'you@email.com',
                    ),
                    // The validator receives the text that the user has entered.
                  ),
                ),
                Container(
                    //  color: Color.fromARGB(0, 8, 83, 49),
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextFormField(
                        controller: _passwordController,
                        key: _passKey,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              child: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            labelText: 'Enter Password'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter password';
                          } else if (value.length < 8) {
                            return 'Password should be more than 8 characters';
                          } else {
                            return null;
                          }
                        })),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: TextButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: const Text(
                          'Forgett password',
                          style: TextStyle(
                              color: Color.fromARGB(255, 62, 127, 66)),
                        ),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Color.fromARGB(255, 62, 127, 66)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                      color: Color.fromARGB(255, 62, 127, 66),
                      height: 50,
                      width: 10,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(40),
                          primary: Color.fromARGB(255, 62, 127, 66),
                        ),
                        child: const Text(
                          'Login',
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            const SnackBar(content: Text('Processing Data'));
                            _formKey.currentState!.save();
                            signIn();
                            Auth();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => MyHomePage(
                                      title: 'Greenhouses',
                                    )));
                          }

                          print(_nameController.text);
                          print(_passwordController.text);
                        },
                      )),
                ),
                Container(
                    alignment: AlignmentDirectional.center,
                    padding: const EdgeInsets.all(5),
                    child: Row(children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 62, 127, 66)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => FormPage()));
                        },
                      )
                    ])),
              ]),
            )));
  }
}
