import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutterproject/screen/order_history_screen.dart';
import 'package:newflutterproject/screen/product_summary.dart';
import 'package:newflutterproject/utilities/assets_path.dart';

class ProductInventoryScreen extends StatefulWidget {
  const ProductInventoryScreen({super.key});

  @override
  State<ProductInventoryScreen> createState() => _ProductInventoryScreenState();
}

class _ProductInventoryScreenState extends State<ProductInventoryScreen> {
  RxInt selectedIndex = 0.obs;
  List<String> textlist = ['Outside', 'Sale', 'Inside', 'Damage'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
      body: Column(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            color: const Color(0xffFFFFFF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                  child: PageHeader(
                    text: 'ইনভেন্টরি',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                dateInfobox(),
                const SizedBox(
                  height: 18,
                ),
                const InfoCard(),
                const SizedBox(
                  height: 15,
                ),
                damageDetails()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              selectedIndex.value = index;
                            },
                            child: Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                color: selectedIndex.value == index
                                    ? const Color(0xff3175ef)
                                    : const Color(0xffFFFFFF),
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  textlist[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: selectedIndex.value == index
                                          ? const Color(0xffFFFFFF)
                                          : const Color(0xff21212f)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Padding damageDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Image.asset(AssetsPath.damageImg),
          const SizedBox(
            width: 8,
          ),
          const Text(
            'Damage',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff212325)),
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            'Tk 40500',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xffFD3C4A)),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: const Color(0xffF3FBF7),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsPath.iconImg,
                height: 25,
                width: 25,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Outside',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff676E79),
                ),
              ),
              const Text(
                'Tk 40,500',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff212325),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
