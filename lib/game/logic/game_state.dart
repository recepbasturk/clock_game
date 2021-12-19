part of 'game_cubit.dart';

class GameState {
  GameState({
    this.randomNumMap,
    this.selectedHour,
    this.selectedMinute,
    this.health = 3,
    this.score = 0,
  });

  final Map<int, int>? randomNumMap;
  final int? selectedHour;
  final int? selectedMinute;
  final int health;
  final int score;

  GameState copyWith({
    Map<int, int>? randomNumMap,
    int? selectedHour,
    int? selectedMinute,
    int? health,
    int? score,
  }) {
    return GameState(
      randomNumMap: randomNumMap ?? this.randomNumMap,
      selectedHour: selectedHour ?? this.selectedHour,
      selectedMinute: selectedMinute ?? this.selectedMinute,
      health: health ?? this.health,
      score: score ?? this.score,
    );
  }

  @override
  String toString() {
    return 'GameState{randomNumMap: $randomNumMap, selectedHour: $selectedHour, selectedMinute: $selectedMinute, health: $health, score: $score}';
  }
}
