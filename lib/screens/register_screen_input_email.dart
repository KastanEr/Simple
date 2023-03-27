import 'package:flutter/material.dart';
import 'package:simple/screens/register_screen_input_password.dart';
import 'package:simple/service/firebase_authentication_service.dart';

class RegisterScreenInputEmail extends StatefulWidget {
  const RegisterScreenInputEmail({super.key});

  @override
  State<RegisterScreenInputEmail> createState() => _RegisterScreenInputEmailState();
}

class _RegisterScreenInputEmailState extends State<RegisterScreenInputEmail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputEmailController = TextEditingController();
  String _inputEmail = "";
  String emailRegExp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+";
  bool emailAvailable = false;

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
                  children: const [
                    Text(
                      "Simple",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "회원가입",
                      style: TextStyle(
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
                  controller: _inputEmailController,
                  validator: (String? value) {
                    if (!RegExp(emailRegExp).hasMatch(value!)) {
                      return "잘못된 이메일 형식입니다.";
                    } else {
                      if (emailAvailable) {
                        return null;
                      } else {
                        return "이미 사용중인 이메일 입니다.";
                      }
                    }
                  },
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: "이메일을 입력해주세요",
                    hintStyle: TextStyle(
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
                        onPressed: () {
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
                        onPressed: () async {
                          _inputEmail = _inputEmailController.text;
                          emailAvailable = await FirebaseAuthenticationService.checkEmailAvailable(_inputEmail);
                          if (_formKey.currentState!.validate()) {
                            _inputEmailController.clear();
                            if (mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreenInputPassword(
                                    userEmail: _inputEmail,
                                  ),
                                  fullscreenDialog: true,
                                ),
                              );
                            }
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
                  height: 113,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
