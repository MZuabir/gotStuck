
import 'package:flutter/material.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  double containerHeight = 190;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('LogOut Screen Now you cannot go back.'),
    ));
  }
}
