import 'package:electricomm/pages/login_page.dart';
import 'package:electricomm/utils/colors.dart';
import 'package:electricomm/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import '../widgets/register_widgets/email_textfield.dart';
import '../widgets/register_widgets/password_textfield.dart';

class RegisterPage extends StatefulWidget {
  // final VoidCallback onClickedRegister;

  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/image.jpg"),
        //     fit: BoxFit.cover,
        //   )
        // ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3)),
                  EmailRegisterTextField(
                      errorText: errorText, emailController: emailController),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  PasswordRegisterTextField(
                      passwordController: passwordController),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: const EdgeInsets.all(20),
                    child: FlutterPwValidator(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 1,
                      specialCharCount: 1,
                      minLength: 6,
                      uppercaseCharCount: 1,
                      onSuccess: () {},
                      controller: passwordController,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            // side: const BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.03)),
                        minimumSize: Size.fromHeight(
                            MediaQuery.of(context).size.height * 0.085)),
                    child: Text(
                      "CREATE ACCOUNT",
                      style: GoogleFonts.kanit(
                          color: Colors.black45,
                          // shadows: [
                          //   const Shadow(color: Colors.black, blurRadius: 10)
                          // ],
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.of(context).size.height * 0.04),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage())),
                    child: Text("BACK TO LOGIN",
                        style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                        )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future register() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message!.toLowerCase());
    }
  }
}
