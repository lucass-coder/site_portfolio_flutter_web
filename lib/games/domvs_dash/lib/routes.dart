// import 'package:flame/game.dart' as game;
// import 'package:flutter/material.dart';
// import 'package:site_portfolio/games/lib/overlays/main_menu.dart';
// import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/game_lucas.dart';
// import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/overlays/lucas_finish.dart';
// import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/overlays/lucas_game_over.dart';
// import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/overlays/lucas_main_menu.dart';
// import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/overlays/pause.dart';
// import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/game_ninja.dart';
// import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/overlays/game_over.dart';
// import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/overlays/pause_ninja.dart';
// import 'package:site_portfolio/games/lib/selection_person_page.dart';

// class Routes {
//   static const menu = '/domvs-dash';


//   static Route routes(RouteSettings settings) {
//     MaterialPageRoute _buildRoute(Widget widget) {
//       return MaterialPageRoute(builder: (_) => widget, settings: settings);
//     }

//     switch (settings.name) {
//       case menu:
//         return _buildRoute(const SelectionPersonPage());

//       case ninja:
//         return _buildRoute(
//           game.GameWidget<GameNinja>.controlled(
//             gameFactory: GameNinja.new,
//             overlayBuilderMap: {
//               'MainMenu': (_, game) => MainMenu(game: game),
//               'GameOver': (_, game) => GameOver(game: game),
//               'pauseNinja': (context, game) => PauseNinja(game: game),
//             },
//             initialActiveOverlays: const ['MainMenu'],
//           ),
//         );
//       case lucas:
//         return _buildRoute(
//           game.GameWidget<GameLucas>.controlled(
//             gameFactory: GameLucas.new,
//             overlayBuilderMap: {
//               'LucasMainMenu': (_, game) => LucasMainMenu(game: game),
//               'LucasGameOver': (_, game) => LucasGameOver(game: game),
//               'gameOverlay': (context, game) => PauseOverlay(game: game),
//               'LucasFinish': (context, game) => LucasFinish(game: game),
//             },
//             initialActiveOverlays: const ['LucasMainMenu'],
//           ),
//         );
//       default:
//         throw Exception('Route does not exists');
//     }
//   }
// }
