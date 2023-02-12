import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple/screens/root_screen.dart';
import 'package:simple/service/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Simple());
}

class Simple extends StatelessWidget {
  const Simple({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const RootScreen(),
      },
    );
  }
}
