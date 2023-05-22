part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoInitialEvent extends TodoEvent {}

class TodoAddEvent extends TodoEvent {}

class TodoUpdateEvent extends TodoEvent {}

class TodoDeleteEvent extends TodoEvent {
  final String? todoId;

  TodoDeleteEvent({this.todoId});
}
