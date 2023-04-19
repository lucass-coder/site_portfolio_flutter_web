import 'package:flutter/material.dart';
import 'package:site_portfolio/games/lib/routes.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/screens/home_page.dart';
import 'package:site_portfolio/utils/translation_keys.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Lucas Santana Portfólio',
      theme: ThemeData(primarySwatch: Colors.blue),
      translations: TranslationKeys(),
      locale: const Locale('pt', 'BR'),
      // locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('pt', 'BR'),
      // getPages: [
      //   GetPage(
      //     name: '/home-xp',
      //     page: () => const HomePageXp(),
      //     binding: BindingsBuilder.put(() => ControllerHomePage())
      //   ),
      //   // GetPage(
      //   //   name: '/log-off',
      //   //   page: () => const LogOff(),
      //   // ),
      // ],
      home: const HomePage(),
      // home: const HomePageXp(),
    );
  }
}
