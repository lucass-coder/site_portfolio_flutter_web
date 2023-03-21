import 'package:get/get.dart';

class ControllerHomePage extends GetxController {
  final isAbout = false.obs;
  final isImage = false.obs;
  RxString nomeImage = 'windows'.obs;

  void closeAboutWindow() {
    isAbout(false);
  }

  void openAboutWindow() {
    isAbout(true);
  }

  void closeImagesWindow() {
    isImage(false);
  }

  void openImagesWindow() {
    isImage(true);
  }

  void setImageBackground(String name) {
    print(name);
    nomeImage(name);
  }
}
