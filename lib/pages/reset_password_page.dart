import 'package:electricomm/pages/login_page.dart';
import 'package:electricomm/utils/colors.dart';
import 'package:electricomm/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/email_reset_password_textfield.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Text errorText = Text(
      "email incorrect",
    );
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
                ResetPasswordEmailTextField(
                    emailController: emailController, errorText: errorText),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.03)),
                      minimumSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * 0.05)),
                  child: Text(
                    "RESET PASSWORD",
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
                                builder: (context) => const LoginPage())),
                        child: Text("BACK TO LOGIN",
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

  Future reset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar("Check Email for Password Reset Link");
      Utils.showSnackBar(e.message!.toLowerCase());
    }
  }
}
