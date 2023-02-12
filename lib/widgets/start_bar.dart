import 'package:flutter/material.dart';
import 'package:site_portfolio/widgets/option_language.dart';
import 'package:site_portfolio/widgets/option_shutdown.dart';
import 'package:site_portfolio/widgets/options_start.dart';
import 'package:get/get.dart';

enum IsOptionStart {
  programas,
  projetos,
  idiomas,
  nenhum,
}

class StartBar extends StatefulWidget {
  const StartBar({Key? key}) : super(key: key);

  @override
  State<StartBar> createState() => _StartBarState();
}

class _StartBarState extends State<StartBar> {
  IsOptionStart optionState = IsOptionStart.nenhum;
  bool isHoveredPrograms = false;
  bool isHoveredProjects = false;
  bool isHoveredLeguage = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 224,
          height: 400,
          decoration: BoxDecoration(
            color: const Color(0xffC0C7C8),
            border: Border.all(),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 400,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    '  LUCAS 95',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    OptionStart(
                      icon: 'icon_programs',
                      name: 'skils'.tr,
                      onHover: (_) => setState(() {
                        optionState = IsOptionStart.programas;
                        isHoveredPrograms = true;
                        isHoveredProjects = false;
                        isHoveredLeguage = false;
                      }),
                      onExit: (_) => setState(() {
                        if (optionState == IsOptionStart.programas) {
                        } else {
                          isHoveredPrograms = false;
                          optionState = IsOptionStart.nenhum;
                        }
                      }),
                      isHovered: isHoveredPrograms,
                    ),
                    const SizedBox(height: 8),
                    OptionStart(
                      icon: 'folder',
                      name: 'projects'.tr,
                      onHover: (_) => setState(() {
                        optionState = IsOptionStart.projetos;
                        isHoveredProjects = true;
                        isHoveredPrograms = false;
                        isHoveredLeguage = false;
                      }),
                      onExit: (_) => setState(() {
                        // optionState = IsOptionStart.nenhum;

                        if (optionState == IsOptionStart.projetos) {
                        } else {
                          isHoveredProjects = false;
                        }
                      }),
                      isHovered: isHoveredProjects,
                    ),
                    const SizedBox(height: 8),
                    OptionStart(
                      icon: 'icon_programs',
                      name: 'language'.tr,
                      onHover: (_) => setState(() {
                        optionState = IsOptionStart.idiomas;
                        isHoveredLeguage = true;
                        isHoveredProjects = false;
                        isHoveredPrograms = false;
                      }),
                      onExit: (_) => setState(() {
                        // optionState = IsOptionStart.nenhum;

                        if (optionState == IsOptionStart.idiomas) {
                        } else {
                          isHoveredLeguage = false;
                        }
                      }),
                      isHovered: isHoveredLeguage,
                    ),
                    const Spacer(),
                    const Divider(),
                    OptionShutdown(icon: 'icon_shutdown', name: 'turnOf'.tr),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: optionState == IsOptionStart.programas,
          child: Container(
            color: const Color(0xffC0C7C8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionShutdown(icon: 'flutter', name: 'Flutter            '),
                OptionShutdown(icon: 'dart', name: 'Dart               '),
                OptionShutdown(icon: 'angular', name: 'Angular          '),
                OptionShutdown(icon: 'react1', name: 'React             '),
                OptionShutdown(icon: 'html', name: 'HTML             '),
                OptionShutdown(icon: 'css', name: 'CSS                '),
                OptionShutdown(icon: 'javascript', name: 'JavaScript    '),
              ],
            ),
          ),
        ),
        Visibility(
          visible: optionState == IsOptionStart.projetos,
          child: Container(
            color: const Color(0xffC0C7C8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionShutdown(
                  icon: 'icon_shutdown',
                  name: 'Projeto 1 ',
                ),
                OptionShutdown(icon: 'icon_shutdown', name: 'Projeto 2 '),
              ],
            ),
          ),
        ),
        Visibility(
          visible: optionState == IsOptionStart.idiomas,
          child: Container(
            color: const Color(0xffC0C7C8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionLanguage(
                  icon: 'bandeira-brasil',
                  name: 'portuguese'.tr,
                ),
                OptionLanguage(
                  icon: 'bandeira-eua',
                  name: 'english'.tr,
                  translate: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
