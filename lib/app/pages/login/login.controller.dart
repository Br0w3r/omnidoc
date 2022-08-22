import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:omnidoc/app/utils/msg.utils.dart';
import 'package:omnidoc/core/routes/pages.dart';
import 'package:omnidoc/core/values/environments.dart';
import 'package:omnidoc/data/services/login/login.contract.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  late ILoginService _loginService;

  var loginText = 'Ingresar'.obs;
  var duration = const Duration(seconds: 3);
  var rondButton = RoundedLoadingButtonController().obs;

  LoginController(this._loginService);

  @override
  void onClose() {
    super.onClose();
    rondButton.close();
  }

  startTime(BuildContext context) async {
    rondButton.value.start();
    return singIn(context);
  }

  singIn(BuildContext context) async {
    await _loginService.singIn().then((model) {
      if (model!.id != null) {
        Timer(duration, () => Get.offAllNamed(Routes.main));
        return rondButton.value.success();
      } else {
        SnackUtils.error("Ocurrio un error", "Advertencia");
        return rondButton.value.error();
      }
    });
  }
}
