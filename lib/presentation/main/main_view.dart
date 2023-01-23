import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/main/home_page.dart';
import 'package:flutter_clean_architecture/presentation/main/notification_page.dart';
import 'package:flutter_clean_architecture/presentation/main/search_page.dart';
import 'package:flutter_clean_architecture/presentation/main/settings_page.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    SettingsPage()
  ];

  List<String> title = const [
    AppString.home,
    AppString.search,
    AppString.notification,
    AppString.settings,
  ];

  var _title = AppString.home;
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: pages[_currentPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: ColorManager.black, spreadRadius: AppSize.s1_5)
        ]),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.blue,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentPage,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: AppString.home),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: AppString.search),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: AppString.notification),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: AppString.settings),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentPage = index;
      _title = title[index];
    });
  }
}
