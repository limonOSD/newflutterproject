import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Wrap(
          children: [
            CircleAvatar(
              maxRadius: 25,
              child: Icon(Icons.person),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(
                  'Hello Zahidul',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sales officer',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Material(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: 40,
              width: 35,
              child: const Icon(
                Icons.notifications,
                color: Colors.black45,
              ),
            ),
          ),
        )
      ],
    );
  }
}
