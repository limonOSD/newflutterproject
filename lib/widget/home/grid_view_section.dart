import 'package:flutter/material.dart';
import 'package:newflutterproject/utilities/grid_button.dart';

class Gridviewbuttonsection extends StatelessWidget {
  const Gridviewbuttonsection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      children: [
        buildGridButton("Dashboard", Colors.blue, Icons.dashboard, () {}),
        buildGridButton("Retailer", Colors.pink, Icons.person, () {}),
        buildGridButton("Orders", Colors.purple, Icons.list_alt, () {}),
        buildGridButton("Summary", Colors.green, Icons.summarize, () {}),
        buildGridButton("Product", Colors.orange, Icons.inventory, () {}),
        buildGridButton("Route", Colors.teal, Icons.map, () {}),
      ],
    );
  }
}
