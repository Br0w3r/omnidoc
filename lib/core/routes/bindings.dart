import 'package:get/get.dart';
import 'package:omnidoc/app/pages/home/home.controller.dart';
import 'package:omnidoc/app/pages/login/login.controller.dart';
import 'package:omnidoc/app/pages/splash/splash.controller.dart';
import 'package:omnidoc/data/services/login/login.contract.dart';

class SplashBinding implements Bindings {
  late ILoginService _loginService;

  SplashBinding(this._loginService);

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(_loginService));
  }
}

class LoginBinding implements Bindings {
  late ILoginService _loginService;

  LoginBinding(this._loginService);

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(_loginService));
  }
}

class HomeBinding implements Bindings {
  HomeBinding();

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
