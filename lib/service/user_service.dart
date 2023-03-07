import 'package:simple/models/project_model.dart';
import 'package:simple/models/user_model.dart';
import 'package:simple/service/firebase_firestore_service.dart';

class UserService {
  static UserModel? user;
  static List<ProjectModel> projectList = [];

  static initUserData(Map<String, dynamic> json) {
    user = UserModel.fromJson(json);
    for (var projectId in user!.projectIdList) {
      FirebaseFirestoreService.db
          .collection("Projects")
          .doc(projectId)
          .snapshots()
          .listen((event) {
        projectList.add(ProjectModel.fromJson(event.data()!));
      });
    }
  }
}
