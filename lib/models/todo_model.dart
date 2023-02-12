class TodoModel {
  String title;
  String description;
  DateTime? deadLine;
  DateTime? finalDeadLine;
  bool done;
  bool important;

  TodoModel({
    this.title = "무제",
    this.description = "",
    this.deadLine,
    this.finalDeadLine,
    this.done = false,
    this.important = false,
  });

  TodoModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        description = json["description"],
        deadLine = json["deadLine"].toDate(),
        finalDeadLine = json["finalDeadLine"].toDate(),
        done = json["done"],
        important = json["important"];

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "deadLine": deadLine,
        "finalDeadLine": finalDeadLine,
        "done": done,
        "important": important,
      };

  void toggleDone() => done = !done;

  void toggleImportant() => important = !important;
}
