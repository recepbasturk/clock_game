import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../../score/score.dart';
import '../game.dart';

class AnalogClocksWidget extends StatelessWidget {
  const AnalogClocksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<GameCubit, GameState>(
        buildWhen: (previous, current) {
          return previous.randomNumMap != current.randomNumMap;
        },
        builder: (context, state) {
          return ColoredBox(
            color: Colors.white,
            child: Row(
              children: _analogClocksWidget(
                state.randomNumMap,
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _analogClocksWidget(Map<int, int>? randomNumMap) {
    final List<Widget> analogClocks = [];
    randomNumMap!.forEach((key, value) {
      analogClocks.add(
        _AnalogClocksWidgetBuild(
          hourHand: key,
          minuteHand: value,
        ),
      );
    });

    return analogClocks;
  }
}

class _AnalogClocksWidgetBuild extends StatelessWidget {
  const _AnalogClocksWidgetBuild({this.hourHand, this.minuteHand});

  final int? hourHand;
  final int? minuteHand;

  @override
  Widget build(BuildContext context) {
    final gameCubit = context.read<GameCubit>();
    final l10n = context.l10n;

    return Flexible(
      child: Stack(
        children: [
          AnalogClockBuild(
            hourHand: hourHand,
            minuteHand: minuteHand,
          ),
          Center(
            child: SizedBox(
              height: 110,
              width: 110,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                onTap: () {
                  if (answerTrue(gameCubit)) {
                    answerTrueReturn(gameCubit, l10n, context);
                  } else {
                    // -If the selected hour is wrong, it will work.
                    gameCubit.answerFalse();
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          contentPadding: const EdgeInsets.all(10),
                          children: <Widget>[
                            if (healthZero(gameCubit))
                              answerFalseAndHealthZero(gameCubit, l10n, context)
                            else
                              answerFalse(l10n, context),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool answerTrue(gameCubit) => gameCubit.state.selectedHour == hourHand;

  void answerTrueReturn(gameCubit, l10n, BuildContext context) {
    gameCubit.answerTrue();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(10),
          children: <Widget>[
            GameDialog(
              title: l10n.gamePageCongratulations,
              animation: 'answer_true.json',
              buttonText: l10n.gamePageNext,
              onPressed: () {
                gameCubit.nextStage();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  bool healthZero(gameCubit) => gameCubit.state.health == 0;

  GameDialog answerFalseAndHealthZero(gameCubit, l10n, BuildContext context) {
    return GameDialog(
      title: l10n.gamePageGameOver,
      animation: 'game_over.json',
      buttonText: l10n.gamePageGameOverRestart,
      onPressed: () {
        final scoreCubit = context.read<ScoreCubit>();
        scoreCubit.saveScore(
          score: gameCubit.state.score,
        );
        gameCubit.gameOver();
        Navigator.pop(context);
      },
    );
  }

  GameDialog answerFalse(l10n, BuildContext context) {
    return GameDialog(
      title: l10n.gamePageTryAgain,
      animation: 'answer_false.json',
      buttonText: l10n.gamePageTryAgain,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
