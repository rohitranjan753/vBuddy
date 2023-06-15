import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vbuddyproject/welcome_screen.dart';
class FadeInAnimationController extends GetxController{
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value= true;

  }

  Future startSplashAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.offAll(()=> const WelcomeScreen());
  }

}