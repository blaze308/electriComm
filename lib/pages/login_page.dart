import 'package:electricomm/main.dart';
import 'package:electricomm/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedRegister;
  const LoginPage({super.key, required this.onClickedRegister});

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/image.jpg"), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2)),
              TextField(
                keyboardType: TextInputType.emailAddress,
                // key: formkey,
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(25),
                  filled: true,
                  prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Icon(Icons.email_rounded,
                          size: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.black)),
                  fillColor: Colors.white,
                  hintText: "EMAIL",
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                // key: formkey,
                controller: passwordController,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(25),
                  filled: true,
                  prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Icon(Icons.lock_rounded,
                          size: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.black)),
                  fillColor: Colors.white,
                  hintText: "PASSWORD",
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size.fromHeight(
                        MediaQuery.of(context).size.height * 0.09)),
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.kanit(
                      color: Colors.white,
                      shadows: [
                        const Shadow(color: Colors.black, blurRadius: 10)
                      ],
                      fontStyle: FontStyle.normal,
                      fontSize: MediaQuery.of(context).size.height * 0.05),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "PASSWORD",
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            shadows: [
                              const Shadow(
                                  color: Colors.blueGrey, blurRadius: 10)
                            ],
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                          )),
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedRegister,
                          text: "REGISTER",
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            shadows: [
                              const Shadow(color: Colors.grey, blurRadius: 10)
                            ],
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                          )),
                    ])),
                  ],
                ),
              )
            ]),
      ),
    );
  }

  Future login() async {
    showDialog(
        barrierDismissible: true,
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
