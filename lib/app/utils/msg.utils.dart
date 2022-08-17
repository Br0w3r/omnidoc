import 'package:flutter/material.dart';
import 'package:omnidoc/app/utils/colors.utils.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SnackUtils {
  static success(String? message, {title = 'Operacion correcta'}) {
    _showSnack(message!, title: title);
  }

  static error(String message, String title) {
    _showSnack(message, title: title);
  }

  static _showSnack(String message, {String title = 'Mensaje'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: ColorsUtils.hexToColor('#DA7B24'),
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
    );
  }
}
