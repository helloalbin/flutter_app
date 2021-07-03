import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String value = "en";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(tr('select_language')),
              SizedBox(
                height: 20,
              ),
              RadioListTile<String>(
                title: const Text('English'),
                value: 'en',
                groupValue: value,
                onChanged: (newValue) {
                  setState(() {
                    value = newValue;
                  });

                  // context.locale = Locale.fromSubtags(languageCode: newValue);
                  context.setLocale(Locale.fromSubtags(languageCode: newValue));
                },
              ),
              RadioListTile<String>(
                title: const Text('German'),
                value: 'de',
                groupValue: value,
                onChanged: (newValue) {
                  setState(() {
                    value = newValue;
                  });

                  // context.locale = Locale.fromSubtags(languageCode: newValue);
                  context.setLocale(Locale.fromSubtags(languageCode: newValue));
                },
              ),
              RadioListTile<String>(
                title: const Text('Spanish'),
                value: 'es',
                groupValue: value,
                onChanged: (newValue) {
                  setState(() {
                    value = newValue;
                  });

                  // context.locale = Locale.fromSubtags(languageCode: newValue);
                  context.setLocale(Locale.fromSubtags(languageCode: newValue));
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    print("Next step");
                  },
                  child: Text(tr('next_step')))
            ],
          ),
        ),
      ),
    );
  }
}
