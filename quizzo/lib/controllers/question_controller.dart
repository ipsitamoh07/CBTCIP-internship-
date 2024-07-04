import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //animation of progress bar

  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  @override
  void onInit() {
    //fill the bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

      //start our animation
    super.onInit();
  }
}
