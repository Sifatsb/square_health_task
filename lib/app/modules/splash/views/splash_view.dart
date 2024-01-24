import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:square_health_task/app/data/constants/image_path.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath.splashBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Get.height / 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: controller.animation!,
                    builder: (context, child) {
                      return Container(
                        height: controller.animation?.value,
                        width: controller.animation?.value,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(ImagePath.appLogo),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
