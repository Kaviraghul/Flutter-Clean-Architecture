import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 7,
                      child: SearchBar(
                        hintText: "Search for a product, cloth...",
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFebeded)),
                        trailing: [Icon(Icons.search_outlined)],
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 50,
                        child: Icon(
                          Icons.notification_add,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
