import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_term/screens/todo/data/models/todo_model.dart';
import 'dart:convert';

import '../../../../utils/constants.dart';

final FirebaseFirestore _firestore = ConnectFirebase.firestore;
final CollectionReference _todo = _firestore.collection('todo');


class TodoRepository {
  static List<TodoModel> todoList = [];

  // Future<List<RestaurantModel>> getList() => Future.value(todoList);

  static Future<Response> deleteTodoById(String todoId) async {
    Response response = Response();
    try {
      print("Inside delete todo, ${todoId}");
      await _todo.doc(todoId).delete();
      response.status = 200;
      response.message = "Todo deleted successfully";
    } catch (error) {
      response.status = 400;
      response.message = error.toString();
      print(error.toString());
    }
    return response;
  }
  
  static Future<Response> fetchTodoList() async {
    todoList = [];
    Response response = Response();
    try {
      print("Inside fetch todo list");
      QuerySnapshot snapshot = await _todo.get();

      if (snapshot.size > 0) {
        for (QueryDocumentSnapshot document in snapshot.docs) {
          Map<String, dynamic>? documentData =
              document.data() as Map<String, dynamic>?;
          print("Inside fetch todo list, ${documentData.toString()}");
          todoList.add(TodoModel.fromJson(documentData!));
        }
      }
      response.status = 200;
      response.message = "Todo read successfully";
    } catch (error) {
      response.status = 400;
      response.message = error.toString();
    }

    // await _todo.get().then((event) {
    //   todoList = event.docs
    //       .map((doc) => RestaurantModel.fromJson(doc.data()))
    //       .toList();

    // }).onError((error, stackTrace) {
    //   response.status = 400;
    //   response.message = "Something went wrong";
    // });

    return response;
  }

  // static Future<Response> fetchTodoByName(String name) async {
  //   todoList = [];

  //   Response response = Response();

  //   try {
  //     QuerySnapshot snapshot = await _todo.get();

  //     if (snapshot.size > 0) {
  //       for (QueryDocumentSnapshot document in snapshot.docs) {
  //         Map<String, dynamic>? documentData =
  //             document.data() as Map<String, dynamic>?;
  //         String documentName = (documentData!['task'] as String).toLowerCase();
  //         if (documentName.contains(name.toLowerCase())) {
  //           todoList.add(TodoModel.fromJson(documentData));
  //         }
  //       }
  //     }
  //     response.status = 200;
  //     response.message = "Todo read successfully";
  //   } catch (error) {
  //     response.status = 400;
  //     response.message = error.toString();
  //   }

  //   return response;
  // }


}
