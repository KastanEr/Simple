import 'package:simple/models/todo_model.dart';

class ProjectModel {
  late String pid;
  late String title;
  late String constructor;
  List<String> contributorList = [];
  List<String> tagList = [];
  List<dynamic> contentList = [];

  ProjectModel({
    required this.pid,
    required this.title,
    required this.constructor,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    pid = json["pid"];
    title = json["title"];
    constructor = json["constructor"];
    contributorList = json["contributerList"];
    contentList = contentListFromJson(json["contentList"]);
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  List<dynamic> contentListFromJson(List contentListFromJson) {
    List<dynamic> contentList = [];
    for (var content in contentListFromJson) {
      if (content is String) {
        contentList.add(content);
      } else if (content is Map<String, dynamic>) {
        contentList.add(TodoModel.fromJson(content));
      }
    }
    return contentList;
  }

  void addContributor(String uid) {
    contributorList.add(uid);
  }
}
