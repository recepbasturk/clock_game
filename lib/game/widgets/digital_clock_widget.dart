import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game.dart';

class DigitalClockWidget extends StatelessWidget {
  const DigitalClockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) {
        return previous.randomNumMap != current.randomNumMap;
      },
      builder: (context, state) {
        final clockStyle = Theme.of(context).textTheme.displayMedium;
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    // -If selectedHour is not greater than 9, it adds 0 to the beginning of the number.
                    state.selectedHour! > 9
                        ? '${state.selectedHour} :'
                        : '0${state.selectedHour} :',
                    style: clockStyle,
                  ),
                  Text(
                    // -If selectedMinute is 0 or 5, it adds 0 to the beginning of the number.
                    state.selectedMinute == 0 || state.selectedMinute == 5
                        ? ' 0${state.selectedMinute}'
                        : ' ${state.selectedMinute}',
                    style: clockStyle,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
