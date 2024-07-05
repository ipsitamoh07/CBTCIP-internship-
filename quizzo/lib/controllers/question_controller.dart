// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/models/questions.dart';
import 'package:quizzo/screens/score/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //animation of progress bar

  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options']?.toList() ??
                [], // Handle potential missing options key
            answer: question['answer_index'],
          ))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns = 0;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    //fill the bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });

    //start our animation
    //once 60s is completed go to the next question
    _animationController.forward().whenComplete(nextQuestion);
    _pageController =PageController();
    super.onInit();
  }
  //called just before the Controller is deleted from memory
  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    //it will stop the counter
    _animationController.stop();
    update();
    //once user selects an ans after 2s it will go to the next qn
    Future.delayed(Duration(seconds: 2), () {
     nextQuestion();
    });
  }

  void nextQuestion() {
    if(_questionNumber.value != _questions.length){
      _isAnswered = false;
      _pageController.nextPage(
        duration: Duration(milliseconds: 250),
        curve: Curves.ease,
      );

      //Reset the counter
      _animationController.reset();

      //then start again after
      //after timer goes off, go to the next question
      _animationController.forward().whenComplete(nextQuestion);
    }else{
      //get package provides us simple way to navigate to another page
    Get.to(ScoreScreen());
    }

    
  }

  void updateQues(int index) {
    _questionNumber.value = index+1;
    
  }
}
