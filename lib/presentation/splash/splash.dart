import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    const assets = Assets.images;
    return Scaffold(
      backgroundColor: ColorManager.primary,

      body: Center(child: Image.asset(assets.onBoardingImage1.path))
    );
  }
}