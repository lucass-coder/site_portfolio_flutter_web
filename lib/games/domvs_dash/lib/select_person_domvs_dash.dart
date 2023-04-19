import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:site_portfolio/games/domvs_dash/lib/game/doodle_dash.dart';
import 'package:site_portfolio/games/domvs_dash/lib/game/util/color_schemes.dart';
import 'package:site_portfolio/games/domvs_dash/lib/game/widgets/game_over_overlay.dart';
import 'package:site_portfolio/games/domvs_dash/lib/game/widgets/game_overlay.dart';
import 'package:site_portfolio/games/domvs_dash/lib/game/widgets/main_menu_overlay.dart';

class SelectPersonDomvsDash extends StatefulWidget {
  final String title;
  final bool originXp;
  const SelectPersonDomvsDash(
      {super.key, required this.title, required this.originXp});
  @override
  State<SelectPersonDomvsDash> createState() => _SelectPersonDomvsDashState();
}

class _SelectPersonDomvsDashState extends State<SelectPersonDomvsDash> {
  final Game game = DoodleDash();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.audiowideTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GameWidget(
          game: game,
          overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
            'gameOverlay': (context, game) => GameOverlay(game),
            'mainMenuOverlay': (context, game) =>
                MainMenuOverlay(game, originXp: widget.originXp),
            'gameOverOverlay': (context, game) =>
                GameOverOverlay(game, originXp: widget.originXp),
          },
        ),
      ),
    );
  }
}
