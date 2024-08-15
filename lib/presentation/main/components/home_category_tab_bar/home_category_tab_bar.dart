import 'package:flutter/material.dart';

class HomeCategoryTabBar extends StatelessWidget {
  const HomeCategoryTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: tabController,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.transparent,
      dividerColor: Color(0xFFd6d7da),
      padding: EdgeInsets.symmetric(vertical: 8),
      indicatorPadding: EdgeInsets.zero,
      labelPadding: EdgeInsets.only(right: 10),
      tabAlignment: TabAlignment.start,
      tabs: [
        Card.outlined(
          shadowColor: Colors.transparent,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(width: 1, color: Color(0xFFd6d7da))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    "https://www.suratifabric.com/blog/wp-content/uploads/2023/12/Hot-Plunging-V-Neck-Lehenga-Blouse-Designs-2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("dads"),
              ],
            ),
          ),
        ),
        Card.outlined(
          shadowColor: Colors.transparent,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(width: 1, color: Color(0xFFd6d7da))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    "https://www.suratifabric.com/blog/wp-content/uploads/2023/12/Hot-Plunging-V-Neck-Lehenga-Blouse-Designs-2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("dads"),
              ],
            ),
          ),
        ),
        Card.outlined(
          shadowColor: Colors.transparent,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(width: 1, color: Color(0xFFd6d7da))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    "https://www.suratifabric.com/blog/wp-content/uploads/2023/12/Hot-Plunging-V-Neck-Lehenga-Blouse-Designs-2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("dads"),
              ],
            ),
          ),
        ),
        Card.outlined(
          shadowColor: Colors.transparent,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(width: 1, color: Color(0xFFd6d7da))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    "https://www.suratifabric.com/blog/wp-content/uploads/2023/12/Hot-Plunging-V-Neck-Lehenga-Blouse-Designs-2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("dads"),
              ],
            ),
          ),
        ),
        Card.outlined(
          shadowColor: Colors.transparent,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(width: 1, color: Color(0xFFd6d7da))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    "https://www.suratifabric.com/blog/wp-content/uploads/2023/12/Hot-Plunging-V-Neck-Lehenga-Blouse-Designs-2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("dads"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
