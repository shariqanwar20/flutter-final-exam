import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_term/repository/user_respository.dart';
import 'package:final_term/screens/todo/domain/repositories/todo_repo.dart';
import 'package:meta/meta.dart';

import '../../../../utils/constants.dart';
import '../../data/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitialState()) {
    on<TodoInitialEvent>(todoInitialEvent);
    on<TodoAddEvent>(todoAddEvent);
    on<TodoUpdateEvent>(todoUpdateEvent);
    on<TodoDeleteEvent>(todoDeleteEvent);
  }

  FutureOr<void> todoInitialEvent(
      TodoInitialEvent event, Emitter<TodoState> emit) async {
    emit(TododLoadingState());

    final Response response = await TodoRepository.fetchTodoList();

    if (response.status == 200) {
      emit(TodoSuccessState(TodoRepository.todoList));
    } else {
      emit(TodoErrorState(response.message));
    }
  }

  FutureOr<void> todoAddEvent(TodoAddEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> todoUpdateEvent(
      TodoUpdateEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> todoDeleteEvent(
      TodoDeleteEvent event, Emitter<TodoState> emit) async {
    emit(TododLoadingState());
    print("Inside delete todo update event, ${event.todoId}");
     Response response =
        await TodoRepository.deleteTodoById(event.todoId!);

    if (response.status == 200) {
      response = await TodoRepository.fetchTodoList();
      emit(TodoSuccessState(TodoRepository.todoList));
    } else {
      emit(TodoErrorState(response.message));
    }
  }
}
