import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple/screens/register_screen.dart';
import 'package:simple/service/firebase_options.dart';
import 'package:simple/screens/home_screen.dart';
import 'package:simple/screens/login_screen.dart';

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
      initialRoute: '/login_screen',
      routes: {
        '/': (BuildContext context) => const HomeScreen(),
        '/login_screen': (BuildContext context) => const LoginScreen(),
        '/signin_screen': (BuildContext context) => const RegisterScreen(),
      },
    );
  }
}
