import 'package:flutter/material.dart';
import 'package:simple/screens/register_screen_verification_email.dart';
import 'package:simple/service/firebase_authentication_service.dart';

class RegisterScreenInputUsername extends StatefulWidget {
  final String userEmail, userPassword;
  const RegisterScreenInputUsername({
    super.key,
    required this.userEmail,
    required this.userPassword,
  });

  @override
  State<RegisterScreenInputUsername> createState() =>
      _RegisterScreenInputUsernameState();
}

class _RegisterScreenInputUsernameState
    extends State<RegisterScreenInputUsername> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputUserNameController =
      TextEditingController();
  String _inputUserName = "";
  bool userNameAvailable = false;

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
                      "닉네임 입력",
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
                  controller: _inputUserNameController,
                  validator: (String? value) {
                    if (userNameAvailable) {
                      return null;
                    } else {
                      return "이미 사용중인 이름입니다";
                    }
                  },
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: "닉네임을 입력해주세요",
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
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 50),
                            backgroundColor: Colors.blueGrey),
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
                          _inputUserName = _inputUserNameController.text;
                          userNameAvailable =
                              await FirebaseAuthenticationService
                                  .checkUserNameAvailable(_inputUserName);
                          if (_formKey.currentState!.validate()) {
                            await FirebaseAuthenticationService
                                .creatUserAccount(
                              widget.userEmail,
                              widget.userPassword,
                              _inputUserName,
                            );

                            if (mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterScreenVerificationEmail(
                                    userEmail: widget.userEmail,
                                    userPassword: widget.userPassword,
                                    userName: _inputUserName,
                                  ),
                                  fullscreenDialog: true,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 50)),
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
