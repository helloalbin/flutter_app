import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers.dart';
import 'package:flutter_app/splash_screen.dart';
import 'package:flutter_app/supported_locale.dart';
import 'package:flutter_app/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final _navigatorKey = GlobalKey<NavigatorState>();

  try {
    runApp(EasyLocalization(
      supportedLocales: supported_locale,
      path: 'assets/lang',
      fallbackLocale: Locale.fromSubtags(languageCode: 'en'),
      startLocale: Locale.fromSubtags(languageCode: 'en'),
      useFallbackTranslations: true,
      child: MultiProvider(
        providers: providers,
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          theme: appTheme(),
          home: SplashScreen(),
        ),
      ),
    ));
  } catch (e, ex) {
    print(e);
  }
}
