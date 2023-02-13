class ProjectModel {
  late String pid;
  late String title;
  late String constructor;
  List<String> contributorList = [];
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
    contentList = json["contentList"];
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
