part of 'settings_cubit.dart';

class SettingsState {
  SettingsState({
    this.isClockImageNumber,
    this.settingsPageChooseImage,
    this.selectedLanguage,
  });

  final bool? isClockImageNumber;
  final bool? settingsPageChooseImage;
  final String? selectedLanguage;

  SettingsState copyWith({
    bool? isClockImageNumber,
    bool? settingsPageChooseImage,
    String? selectedLanguage,
  }) {
    return SettingsState(
      isClockImageNumber: isClockImageNumber ?? this.isClockImageNumber,
      settingsPageChooseImage:
          settingsPageChooseImage ?? this.settingsPageChooseImage,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
