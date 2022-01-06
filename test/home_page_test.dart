import 'package:clock_game/home_page.dart';
import 'package:clock_game/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Button text test on home page', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );

    expect(find.text('Play'), findsOneWidget);
    expect(find.text('High Score'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
