import 'package:get/get.dart';
import 'package:omnidoc/app/pages/home/home.controller.dart';
import 'package:omnidoc/app/pages/login/login.controller.dart';
import 'package:omnidoc/app/pages/splash/splash.controller.dart';

class SplashBinding implements Bindings {
  SplashBinding();

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}

class LoginBinding implements Bindings {
  LoginBinding();

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class HomeBinding implements Bindings {
  HomeBinding();

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
