import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) {
        return previous.score != current.score;
      },
      builder: (context, state) {
        return Row(
          children: [
            Icon(
              Icons.star_sharp,
              color: Colors.yellow[900],
              size: 30.0,
            ),
            Text(
              state.score.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        );
      },
    );
  }
}
