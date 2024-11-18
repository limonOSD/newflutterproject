import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutterproject/home_screen.dart';

class NewFlutterproject extends StatelessWidget {
  const NewFlutterproject({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
