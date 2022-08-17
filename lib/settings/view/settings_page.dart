import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../../settings/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _language;

  @override
  void initState() {
    final settingsCubit = context.read<SettingsCubit>();
    _language = settingsCubit.state.selectedLanguage ?? 'en';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final settingsCubit = context.watch<SettingsCubit>();
    final bool isClockImageNumber =
        settingsCubit.state.settingsPageChooseImage ?? true;

    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 600,
        width: 1024,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                settingsCubit
                    .chooseImage(settingsCubit.state.isClockImageNumber);
              },
            ),
            title: Text(l10n.settingsPageTitle),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              // Text(
              //   l10n.settingsPageChooseClock,
              //   style: TextStyle(
              //     fontSize: 25,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.green.shade900,
              //   ),
              // ),
              Text(
                l10n.settingsPageNumberedOrUnnumbered,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  chooseImage(
                    onTap: () {
                      settingsCubit.chooseImage(true);
                    },
                    color: isClockImageNumber ? Colors.green : Colors.grey,
                    image: 'assets/images/clock_numbers_turtle.png',
                  ),
                  chooseImage(
                    onTap: () {
                      settingsCubit.chooseImage(false);
                    },
                    color: isClockImageNumber ? Colors.grey : Colors.green,
                    image: 'assets/images/clock_turtle.png',
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  languageRadioListTile(l10n.settingsPageEnglish, 'en'),
                  languageRadioListTile(l10n.settingsPageTurkish, 'tr'),
                  const Expanded(child: SizedBox()),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  settingsCubit.changeClockImage(
                    isClockImageNumber: isClockImageNumber,
                  );
                  settingsCubit.changeLanguage(_language!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        l10n.settingsPageSnackBarSaved,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: const Duration(milliseconds: 1500),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 300,
                    ),
                  );
                },
                child: Text(l10n.settingsPageChangeButton),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell chooseImage({
    required VoidCallback onTap,
    required Color color,
    required String image,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 7.0,
          ),
        ),
        height: 160,
        width: 160,
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }

  Widget languageRadioListTile(l10n, String lang) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: RadioListTile<String>(
          title: Text(l10n),
          value: lang,
          groupValue: _language,
          onChanged: (value) {
            setState(() {
              _language = value;
            });
          },
        ),
      ),
    );
  }
}
