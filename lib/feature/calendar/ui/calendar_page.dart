import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakeibooo_flutter/core/app_color.dart';
import 'package:kakeibooo_flutter/core/widget/size_listenable_container.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizeListenableContainer(
            onSizeChanged: (size) {
              debugPrint(size.toString());
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _CalendarTitleRow(),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 7,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: [
                    for (final date in [
                      'SUN',
                      'MON',
                      'TUE',
                      'WED',
                      'THU',
                      'FRI',
                      'SAT',
                    ])
                      Center(
                        child: Text(
                          date,
                          style: GoogleFonts.mPlusRounded1c(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    for (int i = 1; i < 31; i++) _CalendarCell(day: i),
                  ],
                ),
              ],
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          snap: true,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 32,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.white,
                    child: Text(
                      '2022年5月15日 〜 2022年5月19日',
                      style: GoogleFonts.mPlusRounded1c(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                          _ReceiptCard(shopName: 'ポポラマーラ', price: '¥1,600'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}

class _ReceiptCard extends StatelessWidget {
  const _ReceiptCard({
    required this.shopName,
    required this.price,
    Key? key,
  }) : super(key: key);

  final String shopName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 64,
            color: AppColors.primaryColor,
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              height: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        size: 16,
                      ),
                      SizedBox(width: 2),
                      Text(
                        shopName,
                        style: GoogleFonts.mPlusRounded1c(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on_rounded,
                        size: 16,
                      ),
                      SizedBox(width: 2),
                      Text(
                        price,
                        style: GoogleFonts.mPlusRounded1c(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarTitleRow extends StatelessWidget {
  const _CalendarTitleRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'May 2022',
          style: GoogleFonts.mPlusRounded1c(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: 16,
          splashRadius: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
          iconSize: 16,
          splashRadius: 20,
        ),
      ],
    );
  }
}

class _CalendarCell extends StatelessWidget {
  const _CalendarCell({
    required this.day,
    Key? key,
  }) : super(key: key);

  final int day;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text('$day'),
      ),
    );
  }
}
