import 'package:electricomm/main.dart';
import 'package:electricomm/utils/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onClickedRegister;

  const RegisterPage({super.key, required this.onClickedRegister});

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/image.jpg"), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
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
                          top: MediaQuery.of(context).size.height * 0.2)),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? errorText.data
                            : null,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                      contentPadding: const EdgeInsets.all(25),
                      filled: true,
                      prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Icon(Icons.email_rounded,
                              size: MediaQuery.of(context).size.height * 0.05,
                              color: Colors.black)),
                      fillColor: Colors.white,
                      hintText: "email",
                      hintStyle:
                          const TextStyle(color: Colors.black, fontSize: 20),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) => value != null && value.length < 6
                    //     ? "enter min. 6 characters"
                    //     : null,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                      contentPadding: const EdgeInsets.all(25),
                      filled: true,
                      prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Icon(Icons.lock_rounded,
                              size: MediaQuery.of(context).size.height * 0.05,
                              color: Colors.black)),
                      fillColor: Colors.white,
                      hintText: "PASSWORD",
                      hintStyle:
                          const TextStyle(color: Colors.black, fontSize: 20),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white)),
                    ),
                  ),
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
                        backgroundColor: Colors.orange,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size.fromHeight(
                            MediaQuery.of(context).size.height * 0.09)),
                    child: Text(
                      "CREATE ACCOUNT",
                      style: GoogleFonts.kanit(
                          color: Colors.white,
                          shadows: [
                            const Shadow(color: Colors.black, blurRadius: 10)
                          ],
                          fontStyle: FontStyle.normal,
                          fontSize: MediaQuery.of(context).size.height * 0.032),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedRegister,
                            text: "LOGIN",
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                              shadows: [
                                const Shadow(
                                    color: Colors.black, blurRadius: 10)
                              ],
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                            )),
                      ),
                    ],
                  )
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
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
