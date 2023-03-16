import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../storage/storage_base.dart';
import '../score.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit(this._storage) : super(const ScoreInitial()) {
    _readDataScore();
  }

  final StorageBase _storage;

  Future<void> _readDataScore() async {
    final result = Score(
      score: await _storage.getScore(),
      dateTime: await _storage.getScoreDateTime(),
    );
    emit(ScoreLoaded(result));
  }

  Future<void> saveScore({required int score}) async {
    final dateTimeNow = DateTime.now().toString().substring(0, 16);
    final readScore = await _storage.getScore();
    if (score > readScore) {
      await _dataEmitAndSet(score: score, dateTime: dateTimeNow);
    }
  }

  Future<void> clearScore() async {
    await _dataEmitAndSet(score: 0, dateTime: 'noData');
  }

  Future<void> _dataEmitAndSet({required score, required dateTime}) async {
    await _storage.setScore(score: score);
    await _storage.setScoreDateTime(dateTime: dateTime);

    final result = Score(score: score, dateTime: dateTime);
    emit(ScoreLoaded(result));
  }
}
