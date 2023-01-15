// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:site_portfolio/games/lib/routes.dart';
import 'package:site_portfolio/games/lib/utils/constants.dart';

enum Person { lucas, ninja }

// ignore: must_be_immutable
class SelectionPersonArea extends StatelessWidget {
  final Person person;
  SelectionPersonArea({
    Key? key,
    required this.person,
  }) : super(key: key);

  late String urlPerson;
  late String description;
  late String route;
  late String name;

  @override
  Widget build(BuildContext context) {
    switch (person) {
      case Person.lucas:
        urlPerson = 'assets/images/lucas.png';
        description = lucasDescription;
        name = 'Lucão - FlutterMan';
        route = Routes.lucas;
        break;
      case Person.ninja:
        urlPerson = 'assets/images/persons/ninja/Idle__000.png';
        description = ninjaDescription;
        name = 'CHARUTO';
        route = Routes.ninja;
    }

    return Container(
      height: 450,
      width: 240,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: ExactAssetImage('assets/images/fundo-domvs.png'),
              fit: BoxFit.fill),
          border: Border.all(width: 3),
          color: Colors.black),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(route
              // '/lucas'
              );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 40),
            Image.asset(
              urlPerson,
              height: 180,
            ),
            const SizedBox(height: 30),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
