import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Obx(
          () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/spotify_animation.gif')
                    .paddingOnly(top: 20),
                AnimatedOpacity(
                  opacity: controller.fadeText.value ? 1.0 : 0.0,
                  duration: controller.duration,
                  child: Text(
                    '${controller.nameCorporation}',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
