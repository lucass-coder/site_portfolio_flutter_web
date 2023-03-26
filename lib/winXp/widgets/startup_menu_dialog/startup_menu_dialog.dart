import 'package:flutter/material.dart';
import 'package:site_portfolio/winXp/widgets/startup_menu_dialog/startup_bottom.dart';
import 'package:site_portfolio/winXp/widgets/startup_menu_dialog/user_header.dart';

class StartupMenuDialog extends StatelessWidget {
  const StartupMenuDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color _borderColor = Color.fromRGBO(52, 130, 227, 1);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 384,
          child: UserHeader(),
        ),
        Row(
          children: [
            Container(
              height: 400,
              width: 192,
              // color: Colors.white,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: _borderColor,
                    width: 3,
                  ),
                  right: BorderSide(
                    color: Color(0xFFBCD2E0),
                    width: 3,
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              width: 192,
              // color: Colors.white,
              decoration: const BoxDecoration(
                color: Color(0xFFD3E5FD),
                border: Border(
                  right: BorderSide(
                    color: _borderColor,
                    width: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 384,
          child: StartupBottom(),
        ),
        const SizedBox(height: 40)
      ],
    );
  }
}
