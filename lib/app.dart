import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutterproject/screen/product_inventory_screen.dart';

import 'package:newflutterproject/theme.dart';

class NewFlutterproject extends StatelessWidget {
  const NewFlutterproject({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const ProductInventoryScreen(),
      theme: lightThemeData,
    );
  }
}
