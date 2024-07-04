
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wiz/constants/routes.dart';
import 'package:wiz/services/auth/auth_exception.dart';
import 'package:wiz/services/auth/auth_service.dart';



import 'package:wiz/utilitis/show_error_dialog.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void  dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#D2DE32'),
        title: const Text('Register',
         style: TextStyle(
      fontSize: 30.0, // Font size of the title text
      fontWeight: FontWeight.bold, // Font weight of the title text
      color: Colors.black,
       // Text color of the title text
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
              mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
            children: [
              //Add the GIF before the first TextField
             Image.asset(
                  'assets/images/dustbin.png',
                  width: 100, // Adjust width as needed
                  height: 100,
                   // Adjust height as needed
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    Text(
                      "Enter your email:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  hintText: "Your Email",

                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 0.1,
                    ),
                  ),
                ),
                     ),
                  ],
                ),
             const SizedBox(height: 16),// Add some space between the email and password fields
             Column(
                  children: [
                    Text(
                      "Enter your password:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  hintText: "Your Password",
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
           ),
                  ),
                ),
                     ),
                  ],
                ),
              const SizedBox(height: 16), // Add some space below the password field
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(HexColor("#016A70")),
                  foregroundColor: MaterialStateProperty.all<Color> (Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 50, vertical:15 )),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Button border radius
                    )),
                  animationDuration: const Duration(milliseconds: 200)
                ),
                onPressed: () async {
                  final email=_email.text;
                  final password=_password.text;
                  //
                try{
                  await  AuthService.firebase().createUser(
                    email: email,
                    password: password
                    );
                    AuthService.firebase().sendEmailVerification();
                    Navigator.of(context).pushNamed(verifyRoute);
                } on EmailAlreadyInUseAuthException{
                  await showErrorDialog(
                      context,
                      'Email already in use',
                      );
                }
                on WeakPasswordAuthException{
                   await showErrorDialog(
                      context,
                      'Weak Password',
                      );
  
                } on InvalidEmailAuthException{
                   await showErrorDialog(
                      context,
                      'Invalid Email Address',
                      );
                }
                on GenericAuthException{
                  await showErrorDialog(
                      context,
                      'Failed to register',
                      );
                }
                },
                child: const Text('Register here!'),
                ),
                const SizedBox(height: 12),
                 TextButton(
                    onPressed: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false);
                    },
                    child: const Text(
                      "Already Registered? Click here to login!",
                      style: TextStyle(color: Colors.black),
                      ),
                    )
            ],
          );
          }
        ),
      ),
    )
    );
  }
}