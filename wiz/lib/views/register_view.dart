import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wiz/firebase_options.dart';

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
        backgroundColor: Colors.greenAccent,
        title: const Text('WasteWiz',
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
          future: Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                 ),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
            children: [
              //Add the GIF before the first TextField
             Image.asset(
                  'assets/images/dustbin.png',
                  width: 100, // Adjust width as needed
                  height: 100, // Adjust height as needed
                ),
              TextField(
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
              ),
               const SizedBox(height: 16), // Add some space between the email and password fields
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Password",
                
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
        
                    ),
        
                  ),
                ),
              ),
              const SizedBox(height: 16), // Add some space below the password field
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                  foregroundColor: MaterialStateProperty.all<Color> (Colors.black),
                  animationDuration: const Duration(milliseconds: 200)
                ),
                onPressed: () async {
                  final email=_email.text;
                  final password=_password.text;
                try{
                 final userCrendential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email : email,
                    password : password
                    );
                  print(userCrendential);
                } on FirebaseAuthException catch(e){
                  if(e.code == 'weak-password'){
                    print("weak password");
                  } else if(e.code=='email-already-in-use'){
                    print("Email already in use.");
                  }else if (e.code=="invalid-email"){
                    print("Invalid Email Address");
                  }else{
                    print(e.code);
                  }
                }
                },
                child: const Text('Register here!'),
                ),
            ],
          );
          }
          
        ),
      ),
    )
    );
    
  }
}