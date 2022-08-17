import 'dart:async';
import 'package:get/get.dart';
import 'package:omnidoc/core/routes/pages.dart';

class SplashController extends GetxController {
  //late IAuthService _service;

  var duration = const Duration(seconds: 4);
  var urlImage = "assets/images/logo_esp_small.jpeg";

  SplashController();

  @override
  void onInit() {
    super.onInit();
    _startTime();
  }

  _startTime() async {
    return Timer(duration, checkLoginUser());
  }

  checkLoginUser() async {
    /*
    var currentUser = await _service.checkUser();
    if (currentUser != null && currentUser.id != 0) {
      Get.offAllNamed(Routes.main);
    } else {
      Get.offAllNamed(Routes.login);
    }
    */
    Get.offAllNamed(Routes.login);
  }
}
