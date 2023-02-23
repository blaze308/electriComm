import 'package:electricomm/auth/auth_page.dart';
import 'package:electricomm/pages/home/home_page.dart';
import 'package:electricomm/utils/colors.dart';
import 'package:electricomm/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyMainAppWidget());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyMainAppWidget extends StatelessWidget {
  const MyMainAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      color: mainColor,
      title: "ElectriComm",
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error Encountered"));
            } else if (snapshot.hasData) {
              return const MyHome();
            } else {
              return const AuthPage();
            }
          }),
    );
  }
}
