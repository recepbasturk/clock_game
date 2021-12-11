import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game.dart';

class HealthWidget extends StatelessWidget {
  final List<Widget> _healthThree = [
    _redHealthIcon(),
    _redHealthIcon(),
    _redHealthIcon(),
  ];
  final List<Widget> _healthTwo = [
    _redHealthIcon(),
    _redHealthIcon(),
    _greyHealthIcon(),
  ];
  final List<Widget> _healthOne = [
    _redHealthIcon(),
    _greyHealthIcon(),
    _greyHealthIcon(),
  ];
  final List<Widget> _healthZero = [
    _greyHealthIcon(),
    _greyHealthIcon(),
    _greyHealthIcon(),
  ];

  HealthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) {
        return previous.health != current.health;
      },
      builder: (context, state) {
        return Row(
          children: _healthWidget(state.health),
        );
      },
    );
  }

  List<Widget> _healthWidget(int health) {
    switch (health) {
      case 2:
        return _healthTwo;
      case 1:
        return _healthOne;
      case 0:
        return _healthZero;
      default:
        return _healthThree;
    }
  }

  static Widget _redHealthIcon() {
    return const Icon(
      Icons.alarm_add_sharp,
      color: Colors.red,
      size: 30.0,
    );
  }

  static Widget _greyHealthIcon() {
    return const Icon(
      Icons.alarm_off_sharp,
      color: Colors.grey,
      size: 30.0,
    );
  }
}
