import 'package:flutter/material.dart';
import 'package:simple/screens/register_screen_input_email.dart';
import 'package:simple/service/firebase_authentication_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _inputEmailController = TextEditingController();
  final TextEditingController _inputPasswordController = TextEditingController();
  String _inputEmail = "";
  String _inputPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "S",
                  style: TextStyle(
                    fontSize: 180,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Column(
                  children: const [
                    SizedBox(
                      height: 75,
                    ),
                    Text(
                      "imple",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "당신만의 Todo 워크스페이스",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Column(
                children: [
                  TextFormField(
                    controller: _inputEmailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _inputPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        "Password",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _inputEmail = _inputEmailController.text;
                      _inputPassword = _inputPasswordController.text;
                      FirebaseAuthenticationService.signIn(_inputEmail, _inputPassword);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(1000, 60)),
                    child: const Text(
                      "로그인",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("아직 계정이 없으신가요?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreenInputEmail(),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                        child: const Text(
                          "회원가입",
                          style: TextStyle(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("비밀번호를 잊어버리셨나요?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "비밀번호 찾기",
                          style: TextStyle(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
