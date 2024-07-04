
// ignore_for_file: unused_import, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:wiz/constants/routes.dart';
import 'package:wiz/services/auth/auth_service.dart';
import 'package:wiz/views/login_view.dart';
import 'package:wiz/views/notes/main_view.dart';
import 'package:wiz/views/notes/new_note_view.dart';
import 'package:wiz/views/register_view.dart';
import 'package:wiz/views/verify_emailview.dart';
import 'dart:developer' as devtools show log;
// ignore: depend_on_referenced_packages
import 'package:hexcolor/hexcolor.dart';

// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'Wiz Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const LoginView(),
      routes: {
        loginRoute: (context) =>  LoginView(),
        registerRoute: (context) => RegisterView(),
        verifyRoute:(context) => VerifyEmailView(),
         homeRoute:(context) =>  Homepage(),
         mainViewRoute : (context) => NotesView(),
         newNoteRoute:(context) => const NewNoteView()


      },
    ),
    );
}

class Homepage extends StatelessWidget {
  const Homepage
({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: HexColor('#D2DE32'),
        //   title: const Text(
        //     'WasteWiz',
        //     style: TextStyle(
        //       fontSize: 30.0, // Font size of the title text
        //       fontWeight: FontWeight.bold, // Font weight of the title text
        //       color: Colors.black,
        //     ),
        //   ),
        //   elevation: 10.0,
        // ),
        body: Center(
          // child: Padding(
          //   padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
      switch(snapshot.connectionState){
        case ConnectionState.done:
          if (snapshot.hasError) {
            return Text("Error initializing Firebase: ${snapshot.error}");
          }
          final user = AuthService.firebase().currentUser;
          if (user != null) {
            if (user.isEmailVerified) {
              // Return a welcome message with the user's email
              return  const NotesView();
            } else {
              // If email is not verified, show the VerifyEmailView
              return const VerifyEmailView();
            }
          } else {
            // If no user is logged in, show the LoginView
            return const LoginView();
          }
        default:
          return const CircularProgressIndicator(); // Or any other loading indicator
      }
        },
      )
          ),
        );
  }
}
