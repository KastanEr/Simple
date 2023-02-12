import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple/service/firebase_firestore_service.dart';
import 'package:simple/service/user_service.dart';

class HomeScreen extends StatelessWidget {
  final String uid;
  const HomeScreen({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestoreService.db.collection("Users").doc(uid).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          UserService.initUserData(
              snapshot.data!.data() as Map<String, dynamic>);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  semanticLabel: 'menu',
                ),
                onPressed: () async {},
              ),
              title: Text(UserService.user!.name),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    semanticLabel: 'notifications',
                  ),
                  onPressed: () {
                    print('Notification Button');
                  },
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
