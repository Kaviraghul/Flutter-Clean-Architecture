

import 'dart:async';

import 'package:flutter_clean_architecture/data/model.dart';
import 'package:flutter_clean_architecture/presentation/base/base_view_model.dart';

class OnboardingViewModel extends BaseViewModel with OnboardingViewModelInputs, OnboardingViewModelOutputs{

  //streem controllers 
  final StreamController _streamController = StreamController<SliderViewObject>();

   
  // inputs 
  @override
  void dispose(){
    // TODO: implement dipspose
  }

  @override
  void start(){
    // TODO: implement start
  }
  
  @override
  void goNext() {
    // TODO: implement goNext
  }
  
  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }
  
  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
  
  @override
  Sink get inputSliderViewObject => _streamController.sink;
  
  //outputs
  @override
  Stream<SliderViewObject> get outpuSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

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