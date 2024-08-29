part of '../splash.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _setInitialScreen();
    debugPrint("Hello222");
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("Hello111");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _setInitialScreen() async {
    // if the user exists and logged in the the user is navigated to the Home Screen
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed('/home');
    });
  }
}
