import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  List<SliderObject> _getSliderData() => [
        SliderObject(AppString.onBoardingTitle1, AppString.onBoardingSubTitle1,
            ImagesAssets.onBoardingImage1),
        SliderObject(AppString.onBoardingTitle2, AppString.onBoardingSubTitle2,
            ImagesAssets.onBoardingImage2),
        SliderObject(AppString.onBoardingTitle3, AppString.onBoardingSubTitle3,
            ImagesAssets.onBoardingImage3),
        SliderObject(AppString.onBoardingTitle4, AppString.onBoardingSubTitle4,
            ImagesAssets.onBoardingImage4),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: ((context, index) {
          return OnBoardingPage(_list[index]);
        }),
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  AppString.skip,
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            //layout for indicator and arrows
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //left arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImagesAssets.leftArrowIc),
            ),
            onTap: () {
              //go to next slide
              _pageController.animateToPage(
                _getPreviousIndex(), 
                duration: const Duration(microseconds: DurationConstant.d300), 
                curve: Curves.bounceIn);
            },
          ),
        ),

        //circle indicator

        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
              ),
          ],
        ),

        //right arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImagesAssets.rightArrowIc),
            ),
            onTap: () {
              //go to next slide
            },
          ),
        )
      ],
    );
  }

  int _getPreviousIndex(){
    int previousIndex = _currentIndex--;
    if(previousIndex == -1)_currentIndex = _list.length-1;
    return previousIndex;
  }

   int _getNextIndex(){
    int previousIndex = _currentIndex--;
    if(previousIndex == -1)_currentIndex = _list.length-1;
    return previousIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImagesAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImagesAssets.solidCircleIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        Image.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
