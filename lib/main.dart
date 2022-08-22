import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:omnidoc/app/pages/splash/splash.page.dart';
import 'package:omnidoc/core/routes/bindings.dart';
import 'package:omnidoc/core/routes/pages.dart';
import 'package:omnidoc/core/theme/dark_app_theme.dart';
import 'package:omnidoc/data/services/login/login.api.service.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true));
    return GetMaterialApp(
      color: Colors.white,
      theme: darkAppTheme,
      darkTheme: darkAppTheme,
      highContrastTheme: darkAppTheme,
      highContrastDarkTheme: darkAppTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      initialRoute: Routes.splash,
      defaultTransition: Transition.cupertino,
      initialBinding: SplashBinding(LoginApiService()),
      getPages: Pages.pages,
      home: const SplashPage(), //LoginPage(),
    );
  }
}
