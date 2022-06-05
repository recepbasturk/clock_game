abstract class StorageBase {
  Future<void> initial();

  Future<int> getScore();
  Future<void> setScore({required int score});

  Future<String> getScoreDateTime();
  Future<void> setScoreDateTime({required String dateTime});

  Future<bool> getSettingsClockImage();
  Future<void> setSettingsClockImage({required bool isClockImageNumber});

  Future<String> getSelectedLanguage();
  Future<void> setSelectedLanguage({required String language});
}
