// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quizzo/constants.dart';
import 'package:quizzo/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          // resizeBehaviour: ResizeBehaviour.scale,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2,
                ),
                Text(
                  "Let's Take a Quiz!",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                ),
                Text("Enter your details below."),
                Spacer(),
                TextField(
                  decoration: InputDecoration(
                      fillColor: Color.fromARGB(185, 4, 6, 29),
                      filled: true,
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                // Spacer(),
                SizedBox(
                  height: 25.0,
                ),
                InkWell(
                  onTap: () => Get.to(QuizScreen()),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(
                      kDefaultPadding * 0.75,
                    ),
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Start the quiz!",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
