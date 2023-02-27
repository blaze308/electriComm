import 'package:flutter/material.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      // key: formkey,
      controller: emailController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        filled: true,
        prefixIcon: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Icon(Icons.email_rounded,
                size: MediaQuery.of(context).size.height * 0.055,
                color: Colors.black45)),
        fillColor: Colors.white,
        hintText: "email address",
        hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: MediaQuery.of(context).size.height * 0.03),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
            borderSide: const BorderSide(color: Colors.white)),
      ),
    );
  }
}
