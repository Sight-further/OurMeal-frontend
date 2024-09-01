import 'package:flutter/material.dart';
import 'package:our_meal/pages/main/meal_page.dart';
import 'package:our_meal/pages/notification/notification_page.dart';
import 'package:our_meal/pages/setting/setting_page.dart';
import 'package:our_meal/widgets/app_bar_widget.dart';
import 'package:our_meal/widgets/bottom_navigation_bar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final pages = [
    const MealPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _navigateToNotificationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );
  }

  void _navigateToSettingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: MyAppBar(
          onNotificationPressed: _navigateToNotificationPage,
          onSettingPressed: _navigateToSettingPage,
        ),
      ),
      body: pages[_currentIndex],
      // bottomNavigationBar: MyBottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
    );
  }
}