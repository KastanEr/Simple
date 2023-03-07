import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple/service/firebase_authentication_service.dart';

class RegisterScreenVerificationEmail extends StatefulWidget {
  final String userEmail, userPassword, userName;
  const RegisterScreenVerificationEmail({
    super.key,
    required this.userEmail,
    required this.userPassword,
    required this.userName,
  });

  @override
  State<RegisterScreenVerificationEmail> createState() =>
      _RegisterScreenVerificationEmailState();
}

class _RegisterScreenVerificationEmailState
    extends State<RegisterScreenVerificationEmail> {
  bool emailIsNotVerificated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    "이메일 인증",
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
              Text(
                widget.userEmail,
                style: const TextStyle(fontSize: 30),
              ),
              emailIsNotVerificated
                  ? Column(
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "인증메일이 전송되었습니다.\n회원가입을 위해 이메일 인증을 완료해주세요.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: const [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(
                          Icons.error,
                          color: Colors.redAccent,
                          size: 50,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "이메일 인증이 완료되지 않았습니다.\n다시 시도해주세요.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuthenticationService.sendVerificationEmail(
                      FirebaseAuth.instance.currentUser);
                },
                child: const Text(
                  "인증메일 재전송",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuthenticationService.signOut();
                        await FirebaseAuthenticationService.signIn(
                            widget.userEmail, widget.userPassword);
                        if (FirebaseAuthenticationService
                            .checkEmailVerification()) {
                          await FirebaseAuthenticationService.signOut();
                          if (mounted) {
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName("/"),
                            );
                          }
                        } else {
                          emailIsNotVerificated = false;
                          setState(() {});
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
    );
  }
}
