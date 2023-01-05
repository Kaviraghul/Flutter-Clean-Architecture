

import 'dart:async';

import 'package:flutter_clean_architecture/domain/model.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/base/base_view_model.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel with OnboardingViewModelInputs, OnboardingViewModelOutputs{

  //streem controllers 
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
  final assets = Assets.images;

   
  // inputs section

  @override
  void dispose(){
    _streamController.close();
  }

  @override
  void start(){
    _list = _getSliderData();
    _postDataToView();
  }
  
  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) _currentIndex = 0;
    return _currentIndex;
  }
  
  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) _currentIndex = _list.length - 1;
    return _currentIndex;
  }
  
  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }
  
  @override
  Sink get inputSliderViewObject => _streamController.sink;
  
  //outputs section

  @override
  Stream<SliderViewObject> get outpuSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

   //private function
   List<SliderObject> _getSliderData() => [
        SliderObject(AppString.onBoardingTitle1, AppString.onBoardingSubTitle1,
            assets.onBoardingImage1.path),
        SliderObject(AppString.onBoardingTitle2, AppString.onBoardingSubTitle2,
            assets.onBoardingImage2.path),
        SliderObject(AppString.onBoardingTitle3, AppString.onBoardingSubTitle3,
            assets.onBoardingImage3.path),
        SliderObject(AppString.onBoardingTitle4, AppString.onBoardingSubTitle4,
            assets.onBoardingImage4.path),
      ];

  _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}


// input mean the events that our view model will recieve from our view 
abstract class OnboardingViewModelInputs {
  void goNext();                     // when user clicks on the right arrow or swipe left. 
  void goPrevious();                 // when user clicks on the left arrow or swipe right. 
  void onPageChanged(int index);

  Sink get inputSliderViewObject; // this is the way to add data to the stream input 
}

// input mean the data or the results our view model will send to view 
abstract class OnboardingViewModelOutputs {

  Stream<SliderViewObject> get outpuSliderViewObject;

}


class SliderViewObject{
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex; 

  SliderViewObject(this.sliderObject ,this.numberOfSlides ,this.currentIndex);
}