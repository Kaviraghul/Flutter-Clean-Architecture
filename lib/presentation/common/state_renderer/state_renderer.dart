// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/mapper/mapper.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/font_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/styles_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType {
  //POPUP LOADING STATE
  popupLoadingState,
  popupErrorState,

  //FULL SCREEN LOADING STATE
  fullScreenLoadingState,
  fullScreenErrorState,

  contentScreenState, //UI OF THE SCREEN
  emptyScreenState, //EMPTY VIEW WHEN WE RECIEVE NOTHING
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRenderertype;
  final Failure failure;
  final String message;
  final String title;
  final Function? retryActionFunction;

  StateRenderer({
    Key? key,
    required this.stateRenderertype,
    Failure? failure,
    String? message,
    String? title,
    required this.retryActionFunction,
  })  : message = message ?? AppString.loading,
        title = title ?? EMPTY,
        failure = failure ?? DefaultFailure(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  final asset = Assets.json;

  Widget _getStateWidget(BuildContext context) {
    switch (stateRenderertype) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(
            context, [_getAnimatedWidget(asset.loading.path)]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedWidget(asset.error.path),
          _getMessage(failure.message),
          _getRetryButton(AppString.ok, context)
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsInColumn(
            [_getAnimatedWidget(asset.loading.path), _getMessage(message)]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsInColumn([
          _getAnimatedWidget(asset.error.path),
          _getMessage(failure.message),
          _getRetryButton(AppString.retryAgain, context)
        ]);
      case StateRendererType.contentScreenState:
        return Container(); //todo edit it
      case StateRendererType.emptyScreenState:
        return _getItemsInColumn(
            [_getAnimatedWidget(asset.empty.path), _getMessage(message)]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s1_5)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: AppSize.s12,
                  offset: Offset(AppSize.s0, AppSize.s12))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget _getAnimatedWidget(String assetName) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Lottie.asset(assetName),
    );
  }

  Widget _getMessage(String message) {
    return Text(message,
        style: getMediumStyle(
          color: ColorManager.black,
          fontSize: FontSize.s16,
        ));
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (stateRenderertype == StateRendererType.fullScreenErrorState) {
            return retryActionFunction?.call();
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Text(buttonTitle));
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
