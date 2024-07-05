// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/constants.dart';
import 'package:quizzo/controllers/question_controller.dart';
import 'package:quizzo/models/questions.dart';
import 'package:quizzo/screens/quiz/components/progress_bar.dart';
import 'package:quizzo/screens/quiz/components/question_card.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //So that we have access our controller
    QuestionController _questionController = Get.put(
      QuestionController(),
    );
    return Stack(
      children: [
        WebsafeSvg.asset(
          "assets/icons/bg.svg",
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                  child: PageView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), //to stop swiping to the next question
                      controller: _questionController.pageController,
                      onPageChanged: _questionController.updateQues,
                      itemCount: _questionController.questions.length,
                      itemBuilder: (context, index) => QuestionCard(
                            question: _questionController.questions[index],
                          )))
            ],
          ),
        )
      ],
    );
  }
}
