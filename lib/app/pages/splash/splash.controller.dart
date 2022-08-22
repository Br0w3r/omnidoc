import 'dart:async';
import 'package:get/get.dart';
import 'package:omnidoc/core/routes/pages.dart';
import 'package:omnidoc/data/services/login/login.contract.dart';

class SplashController extends GetxController {
  late final ILoginService _loginService;

  var nameCorporation = 'Spotify'.obs;
  var fadeText = true.obs;
  var duration = const Duration(seconds: 3);

  SplashController(this._loginService);

  @override
  void onInit() async {
    super.onInit();
    await _startTime();
  }

  _startTime() async {
    return Timer(duration, fadeOut);
  }

  fadeOut() {
    fadeText.value = false;
    return Timer(const Duration(seconds: 1), fadeIn);
  }

  fadeIn() {
    nameCorporation.value = 'Cargando...';
    fadeText.value = true;
    return Timer(duration, checkLoginUser);
  }

  checkLoginUser() async {
    var user = await _loginService.checkUser();
    if (user != null && user.id != null) {
      Get.offAllNamed(Routes.main);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
