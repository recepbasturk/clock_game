import 'package:clock_game/storage/storage_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  final StorageSharedPreferences storage = StorageSharedPreferences();
  group('Storage', () {
    setUp(() async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
    });

    test('initial', () async {
      expect(await storage.getScore(), 0);
      expect(await storage.getScoreDateTime(), 'noData');
      expect(await storage.getSettingsClockImage(), true);
    });

    test('Score is set and get (score:10)', () async {
      await storage.setScore(score: 10);
      expect(await storage.getScore(), 10);
    });

    test('ScoreDateTime is set and get (dateTime:2021-12-31 00:00)', () async {
      await storage.setScoreDateTime(dateTime: '2021-12-31 00:00');
      expect(await storage.getScoreDateTime(), '2021-12-31 00:00');
    });

    test('SettingsClockImage is set and get (isClockImageNumber:true)',
        () async {
      await storage.setSettingsClockImage(isClockImageNumber: true);
      expect(await storage.getSettingsClockImage(), true);
    });
  });
}
