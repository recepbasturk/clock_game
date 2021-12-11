part of 'score_cubit.dart';

abstract class ScoreState extends Equatable {
  const ScoreState();

  @override
  List<Object> get props => [];
}

class ScoreInitial extends ScoreState {
  const ScoreInitial();
}

class ScoreLoaded extends ScoreState {
  final Score score;

  const ScoreLoaded(this.score);

  @override
  List<Object> get props => [score];
}
