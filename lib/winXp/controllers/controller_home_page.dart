import 'package:get/get.dart';

class ControllerHomePage extends GetxController {
  final isAbout = false.obs;
  final isImage = false.obs;
  final isGame = false.obs;
  final nomeImage = 'windows'.obs;

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

  void closeGamesWindow() {
    isGame(false);
  }

  void openGamesWindow() {
    isGame(true);
  }

  void setImageBackground(String name) {
    nomeImage(name);
  }
}
