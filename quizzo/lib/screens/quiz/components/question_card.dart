// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/constants.dart';
import 'package:quizzo/controllers/question_controller.dart';
import 'package:quizzo/models/questions.dart';
import 'package:quizzo/screens/quiz/components/body.dart';
import 'package:quizzo/screens/quiz/components/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(
      QuestionController(),
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
              question.options.length,
              (index) => Option(
                    index: index,
                    text: question.options[index],
                    press: () => _controller.checkAns(question, index),
                  ))
        ],
      ),
    );
  }
}
