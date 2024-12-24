import 'package:flutter/material.dart';
import 'package:newflutterproject/screen/cart_screen.dart';
import 'package:newflutterproject/utilities/assets_path.dart';

class ProductSummaryScreen extends StatelessWidget {
  const ProductSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: Column(
          children: [
            pageHeader(),
            const SizedBox(
              height: 30,
            ),
            const CustomDatePicker(),
            const SizedBox(
              height: 25,
            ),
            Flexible(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return const ProductSummaryCard();
                },
                separatorBuilder: (context, __) {
                  return const SizedBox(height: 15);
                },
                itemCount: 10,
              ),
            ),
            const SubtotalPriceSection(
              oc: 'O/C:',
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff21212F),
              ),
              text: 'Tk 250',
              tktextStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFB5A3D)),
              pdf: 'PDF',
              pdfImg: AssetsPath.pdfDownloderImg,
            )
          ],
        ),
      ),
    );
  }

  Row pageHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.arrow_back_ios,
          color: Color(0xff21212F),
        ),
        const Text(
          'পণ্য সারাংশ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Image.asset(
          AssetsPath.downloadImg,
          color: const Color(0xff21212F),
        )
      ],
    );
  }
}

class ProductSummaryCard extends StatelessWidget {
  const ProductSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: const Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 120,
              width: 100,
              decoration: const BoxDecoration(
                color: Color(0xffF5F5F8),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Image.asset(
                AssetsPath.oilImg,
                height: 20,
                width: 20,
                scale: 2,
              ),
            ),
          ),
          Container(
            height: 125,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pusti Soyabin Oil 5 Litre',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomQuantityBox(quantity: '04', text: 'Box'),
                      SizedBox(
                        width: 5,
                      ),
                      CustomQuantityBox(quantity: '50', text: 'Pack')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '৪২১ টাকা',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0768FF)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'মোট দোকানদার',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff676E79)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '20',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff21212F)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'O/C',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff676E79)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '20',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff21212F)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffDAF5EF),
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'তারিখ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Container(
              height: 40,
              width: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xffFFFFFF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Jan 10-Jan 12',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0Xff21212f),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(AssetsPath.calenderImg)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
