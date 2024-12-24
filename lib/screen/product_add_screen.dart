// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newflutterproject/utilities/assets_path.dart';

class ProductAddScreen extends StatelessWidget {
  const ProductAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 2.15,
              width: Get.width,
              color: Colors.white,
              child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                  child: Column(
                    children: [
                      const AppbarSection(
                        text: 'পণ্য যোগ করুন',
                        icon: Icons.search,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const ProfileUserCard(),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        height: 90,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const ProductCategorySection(
                              imagePath: AssetsPath.candyImg,
                              categoryName: 'ক্যান্ডি',
                            );
                          },
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 18, right: 18),
              child: AllProducts(
                productCard: [
                  ProductCard(
                      name: 'Pusti Soyabean oil',
                      amount: '5 Litre',
                      price: 'TK 816',
                      onTap: () {},
                      imgPath: AssetsPath.soyabeanoilImg),
                  ProductCard(
                      name: 'Fresh full cream milk',
                      amount: 'powder-500gm',
                      price: 'Tk 818',
                      onTap: () {},
                      imgPath: AssetsPath.powdermilkImg)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileUserCard extends StatelessWidget {
  const ProfileUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      width: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 1))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                CircleAvatar(
                  maxRadius: 25,
                  child: Image.asset(AssetsPath.orderaddImg),
                ),
                const SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'আরিফ হাসান খান',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Image.asset(AssetsPath.orderaddImg1),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'নাজমুল ট্রেডার্স',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                Container(
                  height: 40,
                  width: 85,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(18)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '35%',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(AssetsPath.cartImg1)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppbarSection extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const AppbarSection({
    super.key,
    required this.text,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            onTap;
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        IconButton(
          onPressed: () {
            onTap;
          },
          icon: Icon(
            icon,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class ProductCategorySection extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  const ProductCategorySection({
    super.key,
    required this.imagePath,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2))],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                height: 5,
                width: 5,
                fit: BoxFit.cover,
                scale: 5,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          categoryName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

class AllProducts extends StatelessWidget {
  final List<Widget> productCard;
  const AllProducts({super.key, required this.productCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderSection(text: 'প্রোডাক্ট সমূহ'),
              Container(
                height: 35,
                width: 135,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'বেস্ট সেলিং',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: productCard.length,
            itemBuilder: (context, index) => productCard[index],
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String imgPath;
  final String amount;
  final String price;
  VoidCallback onTap;
  ProductCard(
      {super.key,
      required this.name,
      required this.amount,
      required this.price,
      required this.onTap,
      required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                imgPath,
                height: 100,
                width: 80,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              amount,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 3),
            Text(
              price,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink),
            ),
            const SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    onTap;
                  },
                  child: const Text(
                    'Add to cart +',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  String text;
  HeaderSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
