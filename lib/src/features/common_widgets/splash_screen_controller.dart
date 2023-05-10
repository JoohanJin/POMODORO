import 'package:get/get.dart';

import '../screens/home_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(
        seconds: 2)); // this is the way to give the delay on the Flutter Screen
    animate = true.obs;

    await Future.delayed(const Duration(seconds: 5));
    Get.to(const HomeScreen());
  }
}
