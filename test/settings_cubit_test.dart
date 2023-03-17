import 'package:clock_game/settings/logic/settings_cubit.dart';
import 'package:clock_game/storage/storage_shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  final StorageSharedPreferences storage = StorageSharedPreferences();
  final SettingsCubit settingsCubit = SettingsCubit(storage);
  group('SettingsCubit', () {
    setUp(() async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
    });

    test('initial', () async {
      expect(await storage.getSettingsClockImage(), true);
    });

    test('chooseImage true', () async {
      settingsCubit.chooseImage(true);
      expect(settingsCubit.state.settingsPageChooseImage, true);
    });

    test('chooseImage false', () async {
      settingsCubit.chooseImage(false);
      expect(settingsCubit.state.settingsPageChooseImage, false);
    });

    test('changeClockImage true', () async {
      await settingsCubit.changeClockImage(isClockImageNumber: true);
      expect(settingsCubit.state.isClockImageNumber, true);
      expect(await storage.getSettingsClockImage(), true);
    });

    test('changeClockImage false', () async {
      await settingsCubit.changeClockImage(isClockImageNumber: false);
      expect(settingsCubit.state.isClockImageNumber, false);
      expect(await storage.getSettingsClockImage(), false);
    });
  });
}
