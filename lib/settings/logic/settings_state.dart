part of 'settings_cubit.dart';

class SettingsState {
  SettingsState({
    this.isClockImageNumber,
    this.settingsPageChooseImage,
  });

  final bool? isClockImageNumber;
  final bool? settingsPageChooseImage;

  SettingsState copyWith({
    bool? isClockImageNumber,
    bool? settingsPageChooseImage,
  }) {
    return SettingsState(
      isClockImageNumber: isClockImageNumber ?? this.isClockImageNumber,
      settingsPageChooseImage:
          settingsPageChooseImage ?? this.settingsPageChooseImage,
    );
  }
}
