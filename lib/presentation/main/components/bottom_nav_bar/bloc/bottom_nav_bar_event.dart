part of 'bottom_nav_bar_bloc.dart';

sealed class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();

  @override
  List<Object> get props => [];
}

class BottomNavBarIndexChanged extends BottomNavBarEvent {
  final int index;

  const BottomNavBarIndexChanged(this.index);
}
