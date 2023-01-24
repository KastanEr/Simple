import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  static Future<bool> creatUserAccount(String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  }
}
