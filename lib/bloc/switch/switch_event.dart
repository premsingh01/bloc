import 'package:equatable/equatable.dart';

sealed class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class EnableDisableSwitch extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  final double slider;
  const SliderEvent({required this.slider});
}
