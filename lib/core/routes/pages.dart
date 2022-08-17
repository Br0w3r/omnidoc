import 'package:get/get.dart';
import 'package:omnidoc/app/pages/home/home.page.dart';
import 'package:omnidoc/app/pages/login/login.page.dart';
import 'package:omnidoc/app/pages/splash/splash.page.dart';
import 'package:omnidoc/core/routes/bindings.dart';
part 'routes.dart';

abstract class Pages {
  //static final authService = new AuthApiService();

  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.main,
        page: () => const HomePage(),
        binding: HomeBinding()),
  ];
}
