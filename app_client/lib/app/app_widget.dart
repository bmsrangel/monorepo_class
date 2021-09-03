import 'package:flutter/material.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:project_design_system/project_design_system.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: themeDark,
    ).modular();
  }
}
