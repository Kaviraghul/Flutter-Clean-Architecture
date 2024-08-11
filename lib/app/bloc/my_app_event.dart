part of 'my_app_bloc.dart';

@freezed
class MyAppEvent with _$MyAppEvent {
  const factory MyAppEvent.started() = _Started;
}