part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoActionState extends TodoState {}

class TododLoadingState extends TodoState {}

class TodoSuccessState extends TodoState {
  final List<TodoModel> todoList;
  TodoSuccessState(this.todoList);
}

class TodoErrorState extends TodoState {
  final String error;
  TodoErrorState(this.error);
}