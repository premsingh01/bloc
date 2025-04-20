import 'dart:developer';

import 'package:bloc_study/bloc/to_do/to_do_event.dart';
import 'package:bloc_study/bloc/to_do/to_do_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  List<String> toDoList = [];
  ToDoBloc() : super(ToDoState()) {
    on<AddToDo>(_addToDo);
    on<RemoveToDo>(_removeToDo);
  }

  _addToDo(AddToDo event, Emitter<ToDoState> emit) {
    log("++++++++++++++++${event.task}");
    toDoList.add(event.task);
    emit(state.copyWith(toDoList: List.from(toDoList)));
  }

  _removeToDo(RemoveToDo event, Emitter<ToDoState> emit) {
    toDoList.remove(event.task);
    emit(state.copyWith(toDoList: List.from(toDoList)));
  }
}
