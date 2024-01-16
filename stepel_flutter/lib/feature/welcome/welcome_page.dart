import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/welcome/presentation/widgets/welcome_page_start_button.dart';
import 'package:stepel_flutter/feature/welcome/presentation/widgets/welcome_paragraph.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120, left: 30, right: 30, bottom: 20),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Align(
                  alignment: Alignment.center,
                  child: Text('Stepel', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 2))),
              const SizedBox(height: 50),
              WelcomeParagraph(
                  title: context.localization.welcomePageParagraph1Title,
                  description: context.localization.welcomePageParagraph1Description),
              WelcomeParagraph(
                  title: context.localization.welcomePageParagraph2Title,
                  description: context.localization.welcomePageParagraph2Description),
              WelcomeParagraph(
                  title: context.localization.welcomePageParagraph3Title,
                  description: context.localization.welcomePageParagraph3Description),
              const Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: WelcomePageStartButton(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
