// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:site_portfolio/games/lib/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MainGame extends StatelessWidget {
  const MainGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.routes,
    );
  }
}
