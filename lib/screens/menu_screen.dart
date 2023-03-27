import 'package:flutter/material.dart';
import 'package:simple/screens/create_project_screen.dart';
import 'package:simple/service/firebase_authentication_service.dart';
import 'package:simple/service/user_service.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("메뉴"),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                semanticLabel: 'notifications',
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: getMenuElement(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateProjectScreen(),
                fullscreenDialog: true,
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> getMenuElement() {
    var menuElement = [
      ListTile(
        leading: Container(
          width: 35,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: UserService.user!.profileImageUrl == "" ? const Icon(Icons.account_circle, size: 35) : Image.network(UserService.user!.profileImageUrl),
        ),
        title: Text(
          UserService.user!.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: GestureDetector(
          child: const Icon(Icons.logout),
          onTap: () {
            FirebaseAuthenticationService.signOut();
          },
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.stacked_bar_chart,
          color: Colors.lightGreen,
          size: 35,
        ),
        title: const Text(
          '업무 진척도',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(
          Icons.star,
          color: Colors.yellow.shade700,
          size: 35,
        ),
        title: const Text(
          '오늘',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.wysiwyg,
          color: Colors.deepPurpleAccent,
          size: 35,
        ),
        title: const Text(
          '예정',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.calendar_month,
          color: Colors.red,
          size: 35,
        ),
        title: const Text(
          '캘린더',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {},
      ),
      const Divider(
        height: 10,
        thickness: 2,
        indent: 10,
        endIndent: 10,
      ),
    ];
    for (var projectId in UserService.projectList) {}
    return menuElement;
  }
}
