import 'package:get/get.dart';

class ControllerHomePage extends GetxController {
  final isAbout = false.obs;

  void closeAboutWindow() {
    isAbout(false);
  }

  void openAboutWindow() {
    isAbout(true);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   Get.lazyPut(() => ControllerHomePage());
  // }
}
