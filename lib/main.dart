import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';
import 'package:islamic_app/home_screen.dart';
import 'package:islamic_app/taps/hadeeth/hadeth_details_screen.dart';
import 'package:islamic_app/taps/quran/surah_details_screen.dart';

void main() {
  runApp(IslamicApp());
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        SurahDetailsScreen.routename: (context) => SurahDetailsScreen(),
        HadethDetailsScreen.routename:(context)=>HadethDetailsScreen(),
      },
      theme: AppTheme.light_theme,
      darkTheme: AppTheme.dark_theme,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.routename,
    );
  }
}
