
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wiz/constants/routes.dart';
import 'package:wiz/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: HexColor('#D2DE32'),
        title: const Text('Email Verification')
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Verification email sent!",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
              SizedBox(height: 20),
              const Text("If you haven't received an email yet, then tap the button below.",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),),
              SizedBox(height: 20), // Adding some space between text and button
              TextButton(
                onPressed: () async {
                 await AuthService.firebase().sendEmailVerification();
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                  backgroundColor: MaterialStateProperty.all<Color>(HexColor("#016A70")), // Button background color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ), // Button padding
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Button border radius
                    ),
                  ),
                ),
                child: const Text(
                  'Send email verification',
                  style: TextStyle(
                    fontSize: 16, // Text size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text('Restart' ,
              style: TextStyle(color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
      );
}
}
