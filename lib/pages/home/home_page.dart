import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(title: Text(user.displayName.toString())),
      body: Column(children: [
        Text(user.email!),
        ElevatedButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            child: const Text("Sign Out"))
      ]),
    );
  }
}
