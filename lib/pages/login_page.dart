import 'package:electricomm/main.dart';
import 'package:electricomm/pages/register_page.dart';
import 'package:electricomm/pages/reset_password_page.dart';
import 'package:electricomm/utils/colors.dart';
import 'package:electricomm/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/login_widgets/email_textformfield.dart';
import '../widgets/login_widgets/password_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5)),
                LoginEmailTextField(emailController: emailController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                LoginPasswordTextField(passwordController: passwordController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.03)),
                      minimumSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * 0.05)),
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.kanit(
                        color: Colors.black45,
                        fontStyle: FontStyle.normal,
                        fontSize: MediaQuery.of(context).size.height * 0.05),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordPage())),
                        child: Text("PASSWORD",
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                            )),
                      ),
                      const VerticalDivider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage())),
                        child: Text("REGISTER",
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                            )),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Future login() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message!.toLowerCase());
    }
    // if (e == FirebaseAuthException(code: "invalid-email")) {}
    // else if (e == FirebaseAuthException(code: "user-disabled")) {}
    // else if (e == FirebaseAuthException(code: "user-not-found")) {}
    // else if (e == FirebaseAuthException(code: "wrong-password")) {}
    // else {
    // Utils.showSnackBar(e.message!.toUpperCase());
    // }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
