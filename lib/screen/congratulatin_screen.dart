import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newflutterproject/screen/cart_screen.dart';
import 'package:newflutterproject/utilities/assets_path.dart';

class CongratulatinScreen extends StatelessWidget {
  const CongratulatinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    AssetsPath.doneImg,
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'অভিনন্দন',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'আপনার অর্ডার  সফলভাবে সম্পন্ন হয়েছে',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff7B8392),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  deliveryInfoCard(),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: const Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'পণ্য সমূহ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return ProductRow(
                                    index: index + 1,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 2,
                                  );
                                },
                              ),
                            ),
                            const TransSectionSummary(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 14),
                    child: CustomElevetedButton(
                        hight: 60,
                        width: double.infinity,
                        onTap: () {},
                        text: 'Back to home'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding deliveryInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 175,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xffF5F5F8),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 0.5,
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'বিতরণ তথ্য',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'গ্র‍্যাহকের নাম',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7B8392),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'জাহিদুল হাসান',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'ডেলিভারি',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7B8392),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'এইচ-৩২,১১৫ সিলেট এভিনিউ, সিলেট',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransSectionSummary extends StatelessWidget {
  const TransSectionSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xffEBF5FE)),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'O/C',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                Text(
                  '-60',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFB5A3D)),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'সাবটোটাল:',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff21212F)),
                ),
                Text(
                  'Tk 250',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final int index;
  const ProductRow({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: const Color(0xff0CAF60),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 7,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              index.toString(),
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Fresh Full Cream Milk Powder-500gm',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  CustomQuantityBox(quantity: '04 ', text: 'Box'),
                  SizedBox(
                    width: 5,
                  ),
                  CustomQuantityBox(quantity: '50 ', text: 'Pack')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
