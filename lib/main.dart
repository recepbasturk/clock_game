import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home_page.dart';
import 'l10n/l10n.dart';
import 'score/score.dart';
import 'storage/storage_shared_preferences.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => StorageSharedPreferences(),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScoreCubit(
            context.read<StorageSharedPreferences>(),
          ),
        ),
      ],
      child: const App(),
    ),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock Game',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
            button: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
