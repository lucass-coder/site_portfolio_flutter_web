import 'package:flame/game.dart' as game;
import 'package:flutter/material.dart';
import 'package:site_portfolio/games/lib/overlays/main_menu.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/game_ninja.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/overlays/game_over.dart';
import 'package:site_portfolio/games/lib/selection_person_page.dart';

class Routes {
  static const menu = '/';
  static const lucas = '/lucas';

  static Route routes(RouteSettings settings) {
    MaterialPageRoute _buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      case menu:
        return _buildRoute(const SelectionPersonPage());

      case lucas:
        return _buildRoute(
          game.GameWidget<GameNinja>.controlled(
            gameFactory: GameNinja.new,
            overlayBuilderMap: {
              'MainMenu': (_, game) => MainMenu(game: game),
              'GameOver': (_, game) => GameOver(game: game),
            },
            initialActiveOverlays: const ['MainMenu'],
          ),
        );
      default:
        throw Exception('Route does not exists');
    }
  }
}
