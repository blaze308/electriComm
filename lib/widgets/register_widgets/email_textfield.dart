import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailRegisterTextField extends StatelessWidget {
  const EmailRegisterTextField({
    super.key,
    required this.errorText,
    required this.emailController,
  });

  final Text errorText;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? errorText.data
          : null,
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        errorStyle: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.02),
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
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
            borderSide: const BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
            borderSide: const BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
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
