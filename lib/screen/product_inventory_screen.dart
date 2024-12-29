import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newflutterproject/screen/cart_screen.dart';
import 'package:newflutterproject/screen/order_history_screen.dart';
import 'package:newflutterproject/screen/product_summary.dart';
import 'package:newflutterproject/utilities/assets_path.dart';

class ProductInventoryScreen extends StatefulWidget {
  const ProductInventoryScreen({super.key});

  @override
  State<ProductInventoryScreen> createState() => _ProductInventoryScreenState();
}

class _ProductInventoryScreenState extends State<ProductInventoryScreen> {
  final InventoryController controller = Get.put(InventoryController());
  RxInt selectedIndex = 0.obs;
  List<String> textlist = ['বাহির', 'বিক্রি', 'ভিতর', 'ড্যামেজ'];
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCard(
                        backgroundColor: Color(0xfff3fbf7),
                        borderColor: Color(0XFF0CAF60),
                        imagePath: AssetsPath.outSide,
                        title: 'বাহির',
                        amount: 'TK 40500',
                      ),
                      InfoCard(
                        backgroundColor: Color(0xfff9f9ff),
                        borderColor: Color(0XFF8f94ff),
                        imagePath: AssetsPath.insideImg,
                        title: 'ভিতর',
                        amount: 'TK 40500',
                      ),
                      InfoCard(
                        backgroundColor: Color(0xfff6eaff),
                        borderColor: Color(0XFFa45dd3),
                        imagePath: AssetsPath.saleImg,
                        title: 'বিক্রি',
                        amount: 'TK 40500',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                damageDetails()
              ],
            ),
          ),
          SizedBox(
            height: 47,
            width: double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: textlist.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              selectedIndex.value = index;
                              controller.currentTab(index);
                            },
                            child: Container(
                              height: 30,
                              width: 80,
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
                                      fontSize: 16,
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
          ),
          Expanded(
            child: Obx(() {
              switch (controller.currentTab.value) {
                case 0:
                  return const OutSideWidget();
                case 1:
                  return const SaleWidget();
                case 2:
                  return const Center(child: Text("No Data Available"));
                case 3:
                  return const DamageWidget();
                default:
                  return const Center(child: Text("No Data Available"));
              }
            }),
          ),
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
  final Color? backgroundColor;
  final Color? borderColor;
  final String? imagePath;
  final String title;
  final String amount;

  const InfoCard({
    super.key,
    this.backgroundColor = const Color(0xffF3FBF7),
    this.borderColor = const Color(0xffE0E0E0),
    this.imagePath,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 6,
      width: Get.width / 3.5,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(color: borderColor!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                height: 25,
                width: 25,
                fit: BoxFit.cover,
              ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff676E79),
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff212325),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InventoryController extends GetxController {
  var currentTab = 0.obs;

  void changeTab(int index) {
    currentTab.value = index;
  }
}

class SaleWidget extends StatelessWidget {
  const SaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffFFFFFF),
            ),
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0XFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 4),
                          color: Colors.grey.shade400.withOpacity(0.6)),
                    ],
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetsPath.saleImg,
                    height: 8,
                    width: 8,
                  ),
                ),
              ),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Milk biscuit',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '১৫০ টাকা',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffa45dd3)),
                  ),
                ],
              ),
              subtitle: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      CustomQuantityBox(quantity: '04', text: 'Box'),
                      SizedBox(
                        width: 2,
                      ),
                      CustomQuantityBox(quantity: '04', text: 'Pack')
                    ],
                  ),
                  Wrap(
                    children: [
                      Text(
                        'O/C',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7b8392),
                        ),
                      ),
                      Text(
                        '-1220',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xfffd3c4a),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class OutSideWidget extends StatelessWidget {
  const OutSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffFFFFFF),
            ),
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0XFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 4),
                          color: Colors.grey.shade400.withOpacity(0.6)),
                    ],
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetsPath.outSide,
                    height: 8,
                    width: 8,
                  ),
                ),
              ),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Milk biscuit',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '১৫০ টাকা',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0caf60)),
                  ),
                ],
              ),
              subtitle: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      CustomQuantityBox(quantity: '04', text: 'Box'),
                      SizedBox(
                        width: 2,
                      ),
                      CustomQuantityBox(quantity: '04', text: 'Pack')
                    ],
                  ),
                  Text(' Per pcs Tk 5 ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7b8392))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DamageWidget extends StatelessWidget {
  const DamageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade700.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                ),
                child: Image.asset(AssetsPath.orderaddImg),
              ),
              title: const Text(
                'রাসেল আহমদ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff21212F)),
              ),
              subtitle: const Text(
                'কাশেমের  মোড়',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff676E79)),
              ),
              trailing: const Text(
                '১৫০ টাকা',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xfffd3c4a)),
              ),
            ),
          ),
        );
      },
    );
  }
}
