import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/main/components/common_components.dart';
import 'package:flutter_clean_architecture/presentation/main/home/home_screen.dart';
import 'package:flutter_clean_architecture/presentation/main/orders/orders_page.dart';
import 'package:flutter_clean_architecture/presentation/main/settings/settings_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBarBloc>(
      create: (BuildContext context) => BottomNavBarBloc(),
      child: Scaffold(
        bottomNavigationBar: const AppBottomNavBar(),
        body: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
          builder: (context, state) {
            return _getMainScreenSection(
              state is BottomNavBarIndex ? state.index : 0,
            );
          },
        ),
      ),
    );
  }

  Widget _getMainScreenSection(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const SettingsPage();
      case 2:
        return const OrdersPage();
      default:
        return const HomePage();
    }
  }
}
