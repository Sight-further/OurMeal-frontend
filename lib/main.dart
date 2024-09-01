import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:our_meal/pages/main/main_page.dart';
import 'package:our_meal/pages/main/meal_page.dart';
import 'package:our_meal/pages/notification/notification_page.dart';
import 'package:our_meal/pages/setting/setting_page.dart';

Future<void> main() async {
  //await dotenv.load(fileName: '.env');

  runApp(const MyApp(initialRoute: '/'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const MainPage()),
        GetPage(name: '/meal', page: () => const MealPage()),
        GetPage(name: '/setting', page: () => const SettingPage()),
        GetPage(name: '/notification', page: () => const NotificationPage()),
      ],
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      locale: const Locale('ko'),
    );
  }
}