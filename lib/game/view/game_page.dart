import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GameRandomNumbers(),
      child: BlocProvider<GameCubit>(
        create: (context) => GameCubit(
          context.read<GameRandomNumbers>(),
        ),
        child: const GameView(),
      ),
    );
  }
}

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final gameCubit = context.read<GameCubit>();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 600,
            width: 1024,
            child: Column(
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Container(
                        constraints: const BoxConstraints.expand(),
                        child: const Image(
                          image: AssetImage(
                            'assets/images/digital_hour_animals.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ScoreWidget(),
                          Row(
                            children: [
                              HealthWidget(),
                              GameBackButton(
                                iconColor: Colors.blue,
                                icon: Icons.arrow_back_rounded,
                                onTap: () {
                                  Navigator.popUntil(
                                    context,
                                    (route) => route.isFirst,
                                  );
                                  gameCubit.gameOver();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: DigitalClockWidget(),
                      ),
                    ],
                  ),
                ),
                const AnalogClocksWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
