import 'package:equatable/equatable.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object?> get props => [];
}

class AddToDo extends ToDoEvent {
  final String task;
  const AddToDo({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveToDo extends  ToDoEvent {
  final Object task;
  const RemoveToDo({required this.task});
  
  @override
  List<Object?> get props => [task];
}
