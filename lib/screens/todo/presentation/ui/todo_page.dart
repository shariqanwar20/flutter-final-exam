import 'package:final_term/screens/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/todo_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoBloc todoBloc = TodoBloc();
  @override
  void initState() {
    todoBloc.add(TodoInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo'),
        ),
        body: BlocConsumer<TodoBloc, TodoState>(
          bloc: todoBloc,
          listenWhen: (previous, current) => current is TodoActionState,
          buildWhen: (previous, current) => current is !TodoActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case TododLoadingState:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case TodoSuccessState:
                return _buildTodoList((state as TodoSuccessState).todoList);
              case TodoErrorState:
                return Center(
                  child: Text((state as TodoErrorState).error),
                );
              default:
                return Container();
            }
          },
        ));
  }

  ListView _buildTodoList(List<TodoModel> todoList) {
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoList[index].task),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                todoBloc.add(TodoDeleteEvent(todoId: todoList[index].id));
              },
            ),
          );
        });
  }
}
