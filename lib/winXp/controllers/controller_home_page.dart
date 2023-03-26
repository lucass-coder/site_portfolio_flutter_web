import 'package:get/get.dart';

class ControllerHomePage extends GetxController {
  final isAbout = false.obs;
  final isImage = false.obs;
  final isGame = false.obs;
  final nomeImage = 'windows'.obs;
  final clickRight = false.obs;

  void setClickRight(status) {
    clickRight(status);
  }

  void closeAboutWindow() {
    isAbout(false);
  }

  void openAboutWindow() {
    clickRight(false);
    isAbout(true);
  }

  void closeImagesWindow() {
    clickRight(false);
    isImage(false);
  }

  void openImagesWindow() {
    clickRight(false);
    isImage(true);
  }

  void closeGamesWindow() {
    isGame(false);
  }

  void openGamesWindow() {
    clickRight(false);
    isGame(true);
  }

  void setImageBackground(String name) {
    nomeImage(name);
  }
}
