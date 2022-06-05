import 'package:shared_preferences/shared_preferences.dart';

import 'storage_base.dart';

class StorageSharedPreferences extends StorageBase {
  StorageSharedPreferences() {
    initial();
  }

  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();

  @override
  Future<void> initial() async {
    final SharedPreferences storage = await _storage;

    if (!storage.containsKey('score')) {
      await storage.setInt('score', 0);
      await storage.setString('scoreDateTime', 'noData');
      await storage.setBool('isClockImageNumber', true);
    }
  }

  @override
  Future<int> getScore() async {
    final SharedPreferences storage = await _storage;
    final int result = storage.getInt('score') ?? 0;
    return result;
  }

  @override
  Future<void> setScore({required int score}) async {
    final SharedPreferences storage = await _storage;
    await storage.setInt('score', score);
  }

  @override
  Future<String> getScoreDateTime() async {
    final SharedPreferences storage = await _storage;
    final String result = storage.getString('scoreDateTime') ?? 'noData';
    return result;
  }

  @override
  Future<void> setScoreDateTime({required String dateTime}) async {
    final SharedPreferences storage = await _storage;
    await storage.setString('scoreDateTime', dateTime);
  }

  @override
  Future<bool> getSettingsClockImage() async {
    final SharedPreferences storage = await _storage;
    final bool result = storage.getBool('isClockImageNumber') ?? true;
    return result;
  }

  @override
  Future<void> setSettingsClockImage({required bool isClockImageNumber}) async {
    final SharedPreferences storage = await _storage;
    await storage.setBool('isClockImageNumber', isClockImageNumber);
  }

  @override
  Future<String> getSelectedLanguage() async {
    final SharedPreferences storage = await _storage;
    final String result = storage.getString('selectedLanguage') ?? 'en';
    return result;
  }
  
  @override
  Future<void> setSelectedLanguage({required String language}) async {
    final SharedPreferences storage = await _storage;
    await storage.setString('selectedLanguage', language);
  }
}
