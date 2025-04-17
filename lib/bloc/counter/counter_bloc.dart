import "package:bloc/bloc.dart";
import "package:bloc_study/bloc/counter/couner_state.dart";
import "package:bloc_study/bloc/counter/counter_event.dart";

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // CounerBloc(super.initialState);
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter+1));
  }

  _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter-1));
  }
}
