import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newflutterproject/screen/product_add_screen.dart';
import 'package:newflutterproject/utilities/assets_path.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 15, right: 1),
        child: Column(
          children: [
            const AppbarSection(text: 'আমার ব্যাগ'),
            const ProfileUserCard(),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ProdutCardDetails();
                },
                separatorBuilder: (context, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.grey.shade300,
                    ),
                  );
                },
                itemCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProdutCardDetails extends StatelessWidget {
  const ProdutCardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Get.height / 5,
          width: Get.width / 3.2,
          decoration: BoxDecoration(
            color: Colors.grey.shade300.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Image.asset(
            AssetsPath.powdermilkImg,
            height: 20,
            width: 20,
            scale: 4,
          ),
        ),
        Container(
          height: Get.height / 5,
          width: Get.width / 1.7,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fresh Full Cream Milk Powder-500gm',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    CustomQuantityBox(
                      quantity: '04',
                      text: 'Box',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomQuantityBox(quantity: '50', text: 'Pack'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      '818 Taka',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      '+10 O/C',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colors.white),
                      child: Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const EditableIconBox(
                      icondata: Icons.edit,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EditableIconBox extends StatelessWidget {
  final IconData icondata;
  const EditableIconBox({
    super.key,
    required this.icondata,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 20,
      width: Get.width / 5.5,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: const Color(0xffEBF5FE),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icondata,
            color: Colors.grey.shade500,
          ),
          const SizedBox(
            width: 2,
          ),
          const Text(
            'Edit',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CustomQuantityBox extends StatelessWidget {
  final String quantity;
  final String text;
  const CustomQuantityBox({
    super.key,
    required this.quantity,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 27,
      width: Get.width / 5,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: quantity,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const WidgetSpan(
                child: SizedBox(width: 5),
              ),
              TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
