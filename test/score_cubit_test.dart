import 'package:clock_game/score/logic/score_cubit.dart';
import 'package:clock_game/storage/storage_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  final StorageSharedPreferences storage = StorageSharedPreferences();
  final ScoreCubit scoreCubit = ScoreCubit(storage);
  group('ScoreCubit', () {
    setUp(() async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
    });

    test('initial score 0 and dateTime noData', () async {
      expect(await storage.getScore(), 0);
      expect(await storage.getScoreDateTime(), 'noData');
    });

    test('saveScore first score 10 and second score 20', () async {
      await scoreCubit.saveScore(score: 10);
      expect(await storage.getScore(), 10);
      await scoreCubit.saveScore(score: 20);
      expect(await storage.getScore(), 20);
    });

    test('clearScore score 0 and dateTime noData', () async {
      await scoreCubit.clearScore();
      expect(await storage.getScore(), 0);
      expect(await storage.getScoreDateTime(), 'noData');
    });
  });
}
