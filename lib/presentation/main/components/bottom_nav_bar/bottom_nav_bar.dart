import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/main/components/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            context
                .read<BottomNavBarBloc>()
                .add(BottomNavBarIndexChanged(index));
          },
          currentIndex: state is BottomNavBarIndex ? state.index : 0,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF3ac7a5),
          unselectedItemColor: Color(0xFFafb1b3),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 23,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 23,
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  size: 23,
                ),
                label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.trending_up_outlined,
                  size: 23,
                ),
                label: "Trending"),
          ],
        );
      },
    );
  }
}
