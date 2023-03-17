import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../score.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<ScoreCubit, ScoreState>(
      builder: (context, state) {
        if (state is ScoreInitial) {
          return const CircularProgressIndicator();
        } else if (state is ScoreLoaded) {
          final scoreState = state.score;
          return ScoreLoadWidget(
            l10n: l10n,
            scoreState: scoreState,
          );
        } else {
          return Center(
            child: Text(l10n.appErrorText),
          );
        }
      },
    );
  }
}

class ScoreLoadWidget extends StatelessWidget {
  const ScoreLoadWidget({
    Key? key,
    required this.l10n,
    required this.scoreState,
  }) : super(key: key);

  final AppLocalizations l10n;
  final Score scoreState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 600,
        width: 1024,
        child: Scaffold(
          appBar: AppBar(
            title: Text(l10n.scorePageTitle),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                l10n.scorePageTitle,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                // -If there is no score record, it shows 'no data'.
                scoreState.dateTime == 'noData'
                    ? l10n.scorePageNoData
                    : scoreState.dateTime!,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade900,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_sharp,
                    color: Colors.yellow[900],
                    size: 70.0,
                  ),
                  Text(
                    scoreState.score.toString(),
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              ClearButtonWidget(l10n: l10n),
            ],
          ),
        ),
      ),
    );
  }
}

class ClearButtonWidget extends StatelessWidget {
  const ClearButtonWidget({
    Key? key,
    required this.l10n,
  }) : super(key: key);

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return SimpleDialog(
              contentPadding: const EdgeInsets.all(10),
              children: <Widget>[
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                      l10n.dialogAreYouSure,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    l10n.dialogClearScoreAttentionText,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        l10n.dialogCancelButton,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        context.read<ScoreCubit>().clearScore();
                        Navigator.pop(context);
                      },
                      child: Text(
                        l10n.dialogClearButton,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            );
          },
        );
      },
      child: Text(l10n.dialogClearButton),
    );
  }
}
