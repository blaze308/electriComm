import 'package:flutter/material.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      // key: formkey,
      controller: passwordController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        filled: true,
        prefixIcon: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Icon(Icons.lock_rounded,
                size: MediaQuery.of(context).size.height * 0.055,
                color: Colors.black45)),
        fillColor: Colors.white,
        hintText: "password",
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
