import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/main/components/home_app_bar/home_search_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(
          flex: 7,
          child: HomeSearchBar(),
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            width: 50,
            child: Icon(
              Icons.notification_add,
            ),
          ),
        ),
      ],
    );
  }
}
