import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple/models/user_model.dart';

class FirebaseFirestoreService {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static updateUser(UserModel user) {
    db.collection("Users").doc(user.uid).set(user.toJson());
  }

  static updateRegistedEmailList(String email) {
    db.collection("RegistedUserData").doc("RegistedEmail").update({
      "EmailList": FieldValue.arrayUnion([email])
    });
  }

  static udatedRegistedUserNameList(String name) {
    db.collection("RegistedUserData").doc("RegistedUserName").update({
      "UserNameList": FieldValue.arrayUnion([name])
    });
  }
}
