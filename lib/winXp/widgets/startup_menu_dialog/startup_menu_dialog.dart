import 'package:flutter/material.dart';
import 'package:site_portfolio/winXp/widgets/startup_menu_dialog/user_header.dart';

class StartupMenuDialog extends StatelessWidget {
  const StartupMenuDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 384,
          child: Column(
            children: const [UserHeader()],
          ),
        ),
        Container(
          height: 400,
          width: 384,
          color: Colors.white,
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
