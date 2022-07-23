import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/popular_product_controller.dart';
import 'package:flutter_application_2/routes/route_helper.dart';
import 'package:flutter_application_2/utils/binding.dart';
import 'controllers/cart_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          initialBinding: InitialBinding(),
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  
  }
}
