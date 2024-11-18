import 'package:flutter/material.dart';
import 'package:newflutterproject/widget/home/profilleSection.dart';
import 'package:newflutterproject/widget/home/sellviewsection.dart';

import 'widget/home/grid_view_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSection(),
              SizedBox(height: 20),
              SellviewSection(),
              SizedBox(height: 24),
              Text(
                "Sales officer",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Gridviewbuttonsection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
