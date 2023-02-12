import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple/models/user_model.dart';
import 'package:simple/service/firebase_firestore_service.dart';

class FirebaseAuthenticationService {
  static creatUserAccount(String email, String password, String name) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    sendVerificationEmail(credential.user);

    FirebaseFirestoreService.updateRegistedEmailList(email);
    FirebaseFirestoreService.udatedRegistedUserNameList(name);
    if (credential.user != null) {
      var user = UserModel(uid: credential.user!.uid, name: name);
      FirebaseFirestoreService.updateUser(user);
    }
  }

  static sendVerificationEmail(User? user) {
    user!.sendEmailVerification();
  }

  static bool checkEmailVerification() {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser!.emailVerified;
    } else {
      return false;
    }
  }

  static signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static signOut() {
    FirebaseAuth.instance.signOut();
  }

  static Future<bool> updatePassword(String newPassword) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
      return true;
    } else {
      return false;
    }
  }

  static sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email.");
      }
    }
  }

  static Future<bool> updateUserName(String newName) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(newName);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> checkEmailAvailable(String email) async {
    List<String> emailList = [];
    final docRef = FirebaseFirestoreService.db
        .collection("RegistedUserData")
        .doc("RegistedEmail");
    await docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      emailList = List.from(data["EmailList"]);
    });
    if (emailList.contains(email)) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> checkUserNameAvailable(String userName) async {
    List<String> userNameList = [];
    final docRef = FirebaseFirestoreService.db
        .collection("RegistedUserData")
        .doc("RegistedUserName");
    await docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      userNameList = List.from(data["UserNameList"]);
    });
    if (userNameList.contains(userName)) {
      return false;
    } else {
      return true;
    }
  }
}
