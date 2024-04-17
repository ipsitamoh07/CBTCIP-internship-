

// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wiz/views/login_view.dart';
import 'firebase_options.dart';

// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const Homepage(),
    ),
    );
}

class Homepage extends StatelessWidget {
  const Homepage
({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
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
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
             switch(snapshot.connectionState){
              case ConnectionState.done:
             final user =FirebaseAuth.instance.currentUser;
             if(user?.emailVerified ?? false){
              print("You are a verified user.");
             } else{
              print("You need  to verify your email address.");
             }
              return const Text ('Done');
              default:
               return const Text('Loading...');
             }
            },
          ),
        ),
      ),
    );
  }
}

