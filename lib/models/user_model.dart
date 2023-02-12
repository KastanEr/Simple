import 'package:simple/models/notification_model.dart';
import 'package:simple/models/todo_model.dart';

class UserModel {
  late String uid;
  late String name;
  late String profileImageUrl;
  List<TodoModel> defaultTodoList = [];
  List<String> projectIdList = [];
  List<NotificationModel> notificationList = [];
  int numberOfTodo = 0;
  int numberOfDone = 0;

  UserModel({required this.uid, required this.name, this.profileImageUrl = ""});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    name = json["name"];
    profileImageUrl = json["profileImageUrl"];
    defaultTodoList = todoModelListFromJson(json["defaultTodoList"]);
    projectIdList = json["projectIdList"].cast<String>();
    notificationList = notificationModelListFromJson(json["notificationList"]);
    numberOfTodo = json["numberOfTodo"];
    numberOfDone = json["numberOfDone"];
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> defaultTodoListToJson = [];
    List<Map<String, dynamic>> notificationListToJson = [];
    for (var todoModel in defaultTodoList) {
      defaultTodoListToJson.add(todoModel.toJson());
    }
    for (var notificationModel in notificationList) {
      notificationListToJson.add(notificationModel.toJson());
    }
    return {
      "uid": uid,
      "name": name,
      "profileImageUrl": profileImageUrl,
      "defaultTodoList": defaultTodoListToJson,
      "projectIdList": projectIdList,
      "notificationList": notificationListToJson,
      "numberOfTodo": numberOfTodo,
      "numberOfDone": numberOfDone,
    };
  }

  List<TodoModel> todoModelListFromJson(List todoModelListFromJson) {
    List<TodoModel> todoModelList = [];
    for (var todoModel in todoModelListFromJson) {
      todoModelList.add(TodoModel.fromJson(todoModel));
    }
    return todoModelList;
  }

  List<NotificationModel> notificationModelListFromJson(
      List notificationModelListFromJson) {
    List<NotificationModel> notificationModelList = [];
    for (var notificationModel in notificationModelListFromJson) {
      notificationModelList.add(NotificationModel.fromJson(notificationModel));
    }
    return notificationModelList;
  }
}
