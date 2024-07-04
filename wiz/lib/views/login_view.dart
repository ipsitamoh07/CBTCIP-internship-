// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wiz/constants/routes.dart';
// ignore: unused_import
import 'package:wiz/main.dart';
import 'package:wiz/services/auth/auth_exception.dart';
import 'package:wiz/services/auth/auth_service.dart';

import 'package:wiz/utilitis/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#D2DE32'),
        title: const Text(
          'WasteWiz',
          style: TextStyle(
            fontSize: 30.0, // Font size of the title text
            fontWeight: FontWeight.bold, // Font weight of the title text
            color: Colors.black,
          ),
        ),
        elevation: 10.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: AuthService.firebase().initialize(),
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the children vertically
                children: [
                  Text('HEY! PLEASE LOGIN :)'),
                  SizedBox(height: 25.0),
                  //Add the GIF before the first TextField
                  Image.asset(
                    'assets/images/dustbin.png',
                    width: 100, // Adjust width as needed
                    height: 100, // Adjust height as needed
                  ),
                  const SizedBox(height: 40.0),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width:
                        200, // Add some space between the email and password fields
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      style: TextStyle(fontSize: 14),
                      // minLines: 2,
                      // maxLines: 3,
                    ),
                  ),
                  const SizedBox(
                      height: 16), // Add some space below the password field
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#016A70")),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
                      //button padding
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      )),
                      animationDuration: const Duration(milliseconds: 200),
                    ),
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        AuthService.firebase()
                            .logIn(email: email, 
                            password: password
                            );

                        final user = AuthService.firebase().currentUser;
                        if (user?.isEmailVerified ?? false) {
                          //user's email is verified
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              mainViewRoute, (route) => false);
                        }
                      } on UserNotFoundAuthException{
                        await showErrorDialog(
                            context,
                            'User not found',
                          );
                      }
                      on WrongPasswordAuthException{
                        await showErrorDialog(
                            context,
                            'Wrong credentials',
                          );
                      }
                      on GenericAuthException{
                         await showErrorDialog(
                            context,
                            'Authentication Error',
                          );
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          registerRoute, (route) => false);
                    },
                    child: const Text(
                      "Not Registered Yet? Register Here.",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// Future<void> showErrorDialog(
//   BuildContext context,
//   String text,
//   ){
//     return showDialog(context: context, builder: (context) {
//       AlertDialog(
//         title:const Text(
//           'An error occurred!'
//         ),
//         content: Text(text),
//         actions: [],
//       )
//     },);
//     }

