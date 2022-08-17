import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'login.controller.dart';
// ignore: depend_on_referenced_packages
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() {
        return SingleChildScrollView(
          child: Column(children: <Widget>[
            Center(child: Image.asset('assets/images/logo_esp.jpeg'))
                .paddingAll(40),
            _containButton(context).paddingOnly(top: 20),
          ]).paddingOnly(top: 10, bottom: 50, left: 16, right: 16),
        );
      })),
    );
  }

  Widget _containButton(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.white,
          ),
        ),
        child: RoundedLoadingButton(
          height: MediaQuery.of(context).size.height * 0.065,
          controller: controller.rondButton.value,
          onPressed: () => controller.startTime(),
          resetAfterDuration: true,
          resetDuration: const Duration(seconds: 3),
          color: Theme.of(context).primaryColorLight,
          errorColor: Colors.red,
          child: Text('${controller.loginText}',
              style: Theme.of(context).textTheme.button),
        ));
  }
}
