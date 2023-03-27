import 'package:flutter/material.dart';
import 'package:simple/screens/register_screen_input_username.dart';

class RegisterScreenInputPassword extends StatefulWidget {
  final String userEmail;
  const RegisterScreenInputPassword({
    super.key,
    required this.userEmail,
  });

  @override
  State<RegisterScreenInputPassword> createState() => _RegisterScreenInputPasswordState();
}

class _RegisterScreenInputPasswordState extends State<RegisterScreenInputPassword> {
  bool checkPassword = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputPasswordContorller = TextEditingController();
  String _inputPassword = "";
  String _confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      checkPassword ? "비밀번호 확인" : "비밀번호 입력",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  controller: _inputPasswordContorller,
                  validator: checkPassword
                      ? (String? value) {
                          if (value!.isEmpty || value != _inputPassword) {
                            return "비밀번호가 일치하지 않습니다";
                          }
                          return null;
                        }
                      : (String? value) {
                          return !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(value!) ? "최소 한개의 영문 대문자, 소문자, 숫자를 입력하세요" : null;
                        },
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    hintText: checkPassword ? "비밀번호를 다시 입력해주세요" : "비밀번호를 입력해주세요",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: checkPassword
                            ? () {
                                setState(() {
                                  checkPassword = false;
                                });
                              }
                            : () {
                                Navigator.pop(context);
                              },
                        style: ElevatedButton.styleFrom(minimumSize: const Size(0, 50), backgroundColor: Colors.blueGrey),
                        child: const Text(
                          "이전",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: checkPassword
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  _confirmPassword = _inputPasswordContorller.text;
                                  _inputPasswordContorller.clear();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreenInputUsername(
                                        userEmail: widget.userEmail,
                                        userPassword: _confirmPassword,
                                      ),
                                      fullscreenDialog: true,
                                    ),
                                  );
                                  setState(() {
                                    checkPassword = false;
                                  });
                                }
                              }
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  _inputPassword = _inputPasswordContorller.text;
                                  _inputPasswordContorller.clear();
                                  setState(() {
                                    checkPassword = true;
                                  });
                                }
                              },
                        style: ElevatedButton.styleFrom(minimumSize: const Size(0, 50)),
                        child: const Text(
                          "다음",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
