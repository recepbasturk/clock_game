import 'dart:math';

import 'package:bloc/bloc.dart';

import '../game.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(this._randomNumbers) : super(GameState()) {
    _gameStarted();
  }

  final GameRandomNumbers _randomNumbers;

  void _gameStarted() {
    final Random random = Random();
    final Map<int, int> randomNumMap = _randomNumbers.randomNumbers();
    final int selectedHour = randomNumMap.keys.elementAt(random.nextInt(4));
    final int selectedMinute = randomNumMap[selectedHour]!;
    emit(
      GameState(
        randomNumMap: randomNumMap,
        selectedHour: selectedHour,
        selectedMinute: selectedMinute,
        score: state.score,
        health: state.health,
      ),
    );
  }

  void answerTrue() {
    emit(state.copyWith(score: state.score + 10));
  }

  void answerFalse() {
    emit(state.copyWith(health: state.health - 1));
  }

  void nextStage() {
    _gameStarted();
  }

  void gameOver() {
    emit(state.copyWith(score: 0, health: 3));
    _gameStarted();
  }
}
