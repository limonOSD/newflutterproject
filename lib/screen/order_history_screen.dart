import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutterproject/utilities/assets_path.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<Market> markets = [
    Market(
      title: 'Kakramari Market',
      retailers: 17,
      orders: [
        OrderDetail(
            name: 'Mommad Rasel', customer: 'Kashemer Mor', amount: 470),
        OrderDetail(
            name: 'Emma Johnson', customer: 'Sophia Smith', amount: 550),
        OrderDetail(name: 'Noah Wilson', customer: 'Oliver Brown', amount: 620),
        OrderDetail(
            name: 'Isabella Taylor', customer: 'Ava Martinez', amount: 480),
      ],
    ),
    Market(
      title: 'Kakramari Market',
      retailers: 17,
      orders: [
        OrderDetail(
            name: 'James Davis', customer: 'Liam Anderson', amount: 510),
        OrderDetail(
            name: 'Amelia Garcia', customer: 'Charlotte White', amount: 590),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F8),
      body: Column(
        children: [
          Container(
            height: 180,
            color: Colors.white,
            child: Column(
              children: [
                productHistoryHeader(),
                const SizedBox(
                  height: 20,
                ),
                dateInfobox(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: markets.length,
              itemBuilder: (context, marketIndex) {
                final market = markets[marketIndex];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                  AssetsPath.locatonImg,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                market.title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Text(
                            '${market.retailers} Retailers',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff7B8792)),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        itemCount: market.orders.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, orderIndex) {
                          return const CustomerOrderTitle();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding productHistoryHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  'Order History',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 30,
                  width: 55,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0xffFB2C65),
                  ),
                  child: const Center(
                    child: Text(
                      '560',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomerOrderTitle extends StatelessWidget {
  const CustomerOrderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
            'Rashel Ahmed',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff21212F)),
          ),
          subtitle: const Text(
            'CustomerName',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff676E79)),
          ),
          trailing: const Text(
            'Tk 400',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff008230)),
          ),
        ),
      ),
    );
  }
}

class Market {
  final String title;
  final int retailers;
  final List<OrderDetail> orders;

  Market({required this.title, required this.retailers, required this.orders});
}

class OrderDetail {
  final String name;
  final String customer;
  final int amount;

  OrderDetail(
      {required this.name, required this.customer, required this.amount});
}

Padding dateInfobox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          color: const Color(0xffFFFFFF),
          border: Border.all(color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '12 Novemver 2024',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Image.asset(
              AssetsPath.calenderImg,
              color: const Color(0xff21212F),
            )
          ],
        ),
      ),
    ),
  );
}
