import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'game/game.dart';
import 'l10n/l10n.dart';
import 'score/score.dart';
import 'settings/settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 600,
            width: 1024,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    child: Lottie.asset(
                      'assets/animations/home_page_cloud.json',
                      height: 200,
                      width: 350,
                    ),
                  ),
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/home_page_grass.png',
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/home_page_turtle.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        HomePageButton(
                          l10n: l10n.homePagePlayButton,
                          page: const GamePage(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        HomePageButton(
                          l10n: l10n.homePageHighScoreButton,
                          page: const ScorePage(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        HomePageButton(
                          l10n: l10n.homePageSettingsButton,
                          page: const SettingsPage(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    Key? key,
    required this.l10n,
    required this.page,
  }) : super(key: key);

  final String l10n;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Text(
        l10n,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
