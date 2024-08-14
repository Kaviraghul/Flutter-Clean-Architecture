import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/main/components/home_app_bar/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    super.initState();
  }

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
                const HomeAppBar(),
                TabBar(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
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
                ),

                // gap
                const SizedBox(height: 10),

                // carossal section
                const HomeScreenCarousel(),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hot Sales",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      "https://qph.cf2.quoracdn.net/main-qimg-38ecfbd5e293fab320c12050a4561ff2-lq",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Spacer(),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Red bride",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "₹ 1220",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "bgbdfbdfbdf  dfsdf sd dfsdfsdf dcd sds....",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hot Sales",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      "https://qph.cf2.quoracdn.net/main-qimg-38ecfbd5e293fab320c12050a4561ff2-lq",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Spacer(),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Red bride",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "₹ 1220",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "bgbdfbdfbdf  dfsdf sd dfsdfsdf dcd sds....",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hot Sales",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      "https://qph.cf2.quoracdn.net/main-qimg-38ecfbd5e293fab320c12050a4561ff2-lq",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Spacer(),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Red bride",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "₹ 1220",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "bgbdfbdfbdf  dfsdf sd dfsdfsdf dcd sds....",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class HomeScreenCarousel extends StatefulWidget {
  const HomeScreenCarousel({
    super.key,
  });

  @override
  State<HomeScreenCarousel> createState() => _HomeScreenCarouselState();
}

class _HomeScreenCarouselState extends State<HomeScreenCarousel>
    with SingleTickerProviderStateMixin {
  final CarouselController carouselController = CarouselController();

  @override
  void dispose() {
    carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 150,
          child: CarouselView(
            controller: carouselController,
            itemSnapping: true,
            itemExtent: 300,
            shrinkExtent: 200,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            onTap: (value) async {
              print(value);
              await carouselController.animateTo(
                carouselController.offset + 1,
                duration: const Duration(seconds: 10),
                curve: Curves.easeInOut,
              );
            },
            children: [
              Container(
                key: ValueKey(0),
                color: Colors.green,
                child: Image.network(
                  "https://www.designerz.pk/resource/images/d597e-banner-3-5-.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                key: ValueKey(1),
                color: Colors.green,
                child: Image.network(
                  "https://www.ilsabysamsara.com/cdn/shop/files/head-banner-1920X1280.jpg?v=1701945160&width=2160",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                key: ValueKey(3),
                color: Colors.green,
                child: Image.network(
                  "https://www.designerz.pk/resource/images/91a7f-6d351-cheryls-bridal-banner-3-.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
