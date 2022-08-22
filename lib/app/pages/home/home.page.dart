import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [Text("Hola")],
        ),
      ),
    );
  }
}
