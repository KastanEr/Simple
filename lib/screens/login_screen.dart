import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  onPressedLoginButton() {
    print("로그인");
  }

  onTapRegister() {
    print("회원가입");
  }

  onTapForgotPassword() {
    print("비밀번호 찾기");
  }

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
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
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
                    onPressed: onPressedLoginButton,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(1000, 60)),
                    child: const Text(
                      "Login",
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
                        onTap: onTapRegister,
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
                        onTap: onTapForgotPassword,
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
