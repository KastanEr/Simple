import 'package:simple/models/project_model.dart';
import 'package:simple/models/user_model.dart';

class UserService {
  static UserModel? user;
  static List<ProjectModel> projectList = [];

  static initUserData(Map<String, dynamic> json) async {
    user = UserModel.fromJson(json);
    for (var projectId in user!.projectIdList) {}
  }
}
