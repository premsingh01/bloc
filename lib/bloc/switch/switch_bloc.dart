import 'package:bloc/bloc.dart';
import 'package:bloc_study/bloc/switch/switch_event.dart';
import 'package:bloc_study/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableDisableSwitch>(_enableDisableSwitch);
    on<SliderEvent>(_slider);
  }

  _enableDisableSwitch(EnableDisableSwitch event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
