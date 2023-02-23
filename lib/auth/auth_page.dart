import 'package:electricomm/pages/login_page.dart';
import 'package:electricomm/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickedRegister: toggle)
      : RegisterPage(onClickedRegister: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
