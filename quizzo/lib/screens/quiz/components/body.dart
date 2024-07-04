// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizzo/constants.dart';
import 'package:quizzo/screens/quiz/components/progress_bar.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebsafeSvg.asset(
          "assets/icons/bg.svg",
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressBar(),
                SizedBox(height: kDefaultPadding),
                Text.rich(
                  TextSpan(
                    text: "Question 1",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: kSecondaryColor),
                    children: [
                      TextSpan(
                        text: "/10",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: kSecondaryColor),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                SizedBox(height: kDefaultPadding),
                Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(color: Colors.white),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
