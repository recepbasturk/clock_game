class Score {
  Score({
    this.score,
    this.dateTime,
  });

  final int? score;
  final String? dateTime;

  @override
  String toString() {
    return 'ScoreState{score: $score, dateTime: $dateTime}';
  }
}
