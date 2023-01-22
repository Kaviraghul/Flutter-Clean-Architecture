// The flowstate class and the state renderer class can be connected by passing
// the flowstate object as an argument to the state renderer class's constructor,
// or by setting a reference to the flowstate object in the state renderer class.
// The state renderer class can then access the information it needs from the
// flowstate object to display the current state of the application.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/mapper/mapper.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

//we will be definig the classes for different state below

//loading state for (POP UP , FULL SCREEN)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppString.loading;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

//error state for (POP UP , FULL SCREEN)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

//content state for (FULL SCREEN)
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => EMPTY;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.contentScreenState;
}

//empty state for (FULL SCREEN)
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.emptyScreenState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    showPopUp(BuildContext context, StateRendererType stateRendererType,
        String message) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
                stateRenderertype: stateRendererType,
                message: message,
                retryActionFunction: () {},
              )));
    }

    switch (this.runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            showPopUp(context, getStateRendererType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRenderer(
              stateRenderertype: getStateRendererType(),
              retryActionFunction: retryActionFunction,
              message: getMessage(),
            );
          }
        }
      case ErrorState:
        {
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            showPopUp(context, getStateRendererType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRenderer(
              stateRenderertype: getStateRendererType(),
              retryActionFunction: retryActionFunction,
              message: getMessage(),
            );
          }
        }
      case ContentState:
        {
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenderer(
            stateRenderertype: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          );
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }
}
