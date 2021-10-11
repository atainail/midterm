import 'package:flutter/material.dart';
import 'package:midterm/main.dart';
import 'package:midterm/auth.dart';
import 'package:midterm/sign_up.dart';

class Anonymous extends StatelessWidget {
  const Anonymous({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BasicView(title: 'Anonymous');
  }
}