import 'package:flutter_application_2/controllers/cart_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
     Get.find<CartController>().getCartData();
  }
  
}