import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/routes/route_helper.dart';
import 'package:flutter_application_2/utils/dimension.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

Future<void> _loadResources() async {
  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();
}
  @override
  void initState() {
    super.initState();
    _loadResources();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
                child: Image.asset(
              "Images/FoodLogo3.png",
              width: Dimensions.splashImage,
            )),
          ),
          Center(
            child: Image.asset(
              "Images/FoodLogo4.png",
              width: Dimensions.splashImage,
            ),
          ),
        ],
      ),
    );
  }
}