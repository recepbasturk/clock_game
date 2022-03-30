import 'package:clock_game/game/game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GameCubit', () {
    late GameRandomNumbers randomNumbers;
    late GameCubit gameCubit;

    setUp(() {
      randomNumbers = GameRandomNumbers();
      gameCubit = GameCubit(randomNumbers);
    });

    test('initial health is 3', () {
      expect(gameCubit.state.health, 3);
    });

    test('initial score is 0', () {
      expect(gameCubit.state.score, 0);
    });
    test('score 0 and health 2 after to answerFalse', () {
      gameCubit.answerFalse();
      expect(gameCubit.state.score, 0);
      expect(gameCubit.state.health, 2);
    });

    test('score 10 and health 3 after to answerTrue', () {
      gameCubit.answerTrue();
      expect(gameCubit.state.score, 10);
      expect(gameCubit.state.health, 3);
    });

    test('score 10 and health 3 after to answerTrue and nextStage', () {
      gameCubit.answerTrue();
      gameCubit.nextStage();
      expect(gameCubit.state.score, 10);
      expect(gameCubit.state.health, 3);
    });

    test('score 0 and health 3 after to gameOver', () {
      gameCubit.gameOver();
      expect(gameCubit.state.score, 0);
      expect(gameCubit.state.health, 3);
    });

    test('score 20 and health 3 after to twice answerTrue', () {
      gameCubit
        ..answerTrue()
        ..answerTrue();
      expect(gameCubit.state.score, 20);
      expect(gameCubit.state.health, 3);
    });

    test('score 0 and health 1 after to twice answerFalse', () {
      gameCubit
        ..answerFalse()
        ..answerFalse();
      expect(gameCubit.state.score, 0);
      expect(gameCubit.state.health, 1);
    });
  });
}
