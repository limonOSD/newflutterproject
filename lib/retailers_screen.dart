import 'package:flutter/material.dart';

class RetailersScreen extends StatelessWidget {
  const RetailersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search Retailer",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  underline: const SizedBox(),
                  value: "My route",
                  items: const [
                    DropdownMenuItem(
                      value: "My route",
                      child: Text("My route"),
                    ),
                    DropdownMenuItem(
                      value: "Other route",
                      child: Text("Other route"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: 16),
              buildMarketSection(
                marketName: "Kakramari market",
                retailerCount: 17,
                retailers: [
                  buildRetailerCard(
                    name: "Arif Hasan Khan",
                    subtitle: "Nazmul Traders",
                    percentage: 35,
                    profileImage: "https://via.placeholder.com/150",
                  ),
                  buildRetailerCard(
                    name: "Saiful Rahman",
                    subtitle: "Nazmul Traders",
                    percentage: 0,
                    profileImage: "https://via.placeholder.com/150",
                  ),
                  buildRetailerCard(
                    name: "Farooq Hasan",
                    subtitle: "Nazmul Traders",
                    percentage: 35,
                    profileImage: "https://via.placeholder.com/150",
                  ),
                  buildRetailerCard(
                    name: "Saiful Rahman",
                    subtitle: "Nazmul Traders",
                    percentage: 35,
                    profileImage: "https://via.placeholder.com/150",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.pink,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: const Text("Retailers"),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(Icons.arrow_back_ios),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget buildMarketSection({
    required String marketName,
    required int retailerCount,
    required List<Widget> retailers,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.blueAccent),
                const SizedBox(width: 8),
                Text(
                  marketName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "$retailerCount Retailers",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemCount: retailers.length,
          itemBuilder: (context, index) => retailers[index],
        ),
      ],
    );
  }

  Widget buildRetailerCard({
    required String name,
    required String subtitle,
    required int percentage,
    required String profileImage,
  }) {
    return Container(
      height: 15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(profileImage),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            if (percentage > 0)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "$percentage%",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
