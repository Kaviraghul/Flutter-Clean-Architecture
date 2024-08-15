import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreenCarousel extends StatefulWidget {
  const HomeScreenCarousel({
    super.key,
  });

  @override
  State<HomeScreenCarousel> createState() => _HomeScreenCarouselState();
}

class _HomeScreenCarouselState extends State<HomeScreenCarousel>
    with SingleTickerProviderStateMixin {
  late CarouselController carouselController;
  Timer? _timer;

  final List<String> _imageUrls = [
    "https://www.designerz.pk/resource/images/d597e-banner-3-5-.jpg",
    "https://www.ilsabysamsara.com/cdn/shop/files/head-banner-1920X1280.jpg?v=1701945160&width=2160",
    "https://www.designerz.pk/resource/images/91a7f-6d351-cheryls-bridal-banner-3-.jpg",
    "https://thumbs.dreamstime.com/b/glamorous-shopping-summer-lady-blue-background-58940232.jpg",
    "https://img.freepik.com/premium-photo/cheerful-man-is-being-happy-with-shopping-bags-single-color-background_1289375-322.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1722988800&semt=ais_hybrid",
    "https://img.freepik.com/premium-photo/amused-feminine-girl-waisting-all-money-new-clothes-found-favorite-store-holding-shopping-bags-gazing-excited-taking-off-glasses-seeing-something-fantastic-pink-wall_1258-9813.jpg",
    "https://img.freepik.com/free-photo/happy-man-with-handbags-dancing-after-shopping-spree_482257-18132.jpg",
    "https://img.freepik.com/free-photo/attractive-curly-girl-denim-shirt-holding-big-white-bags-from-clothing-store-isolated-pink-background-charming-long-haired-young-woman-cute-outfit-posing-with-packages-after-shopping_197531-3533.jpg",
    "https://thumbs.dreamstime.com/b/glamorous-shopping-summer-lady-blue-background-58940232.jpg",
  ];

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController(initialItem: 0);

    // Start the timer to animate the carousel
    // _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
    //   final int currentIndex = (carouselController.offset ~/ 300).toInt();
    //   final int nextIndex = (currentIndex + 1) % _imageUrls.length;

    //   carouselController.animateTo(
    //     nextIndex * 300.0,
    //     duration: const Duration(seconds: 1),
    //     curve: Curves.easeInOut,
    //   );
    // });
  }

  @override
  void dispose() {
    _timer?.cancel();
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
            onTap: (value) {
              print(value);
            },
            children: _imageUrls.map((url) {
              return Container(
                color: Colors.green,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
