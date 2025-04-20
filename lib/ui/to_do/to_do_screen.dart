import 'package:bloc_study/bloc/to_do/to_do_bloc.dart';
import 'package:bloc_study/bloc/to_do/to_do_event.dart';
import 'package:bloc_study/bloc/to_do/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToDoBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text("Todo App")),
            body: BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                if (state.toDoList.isEmpty) {
                  return Center(child: Text("No todo list"));
                } else if (state.toDoList.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.toDoList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${state.toDoList[index]} ${index + 1}"),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<ToDoBloc>().add(
                              RemoveToDo(task: state.toDoList[index]),
                            );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<ToDoBloc>().add(AddToDo(task: "Task"));
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
