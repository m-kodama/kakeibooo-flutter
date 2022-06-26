import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakeibooo_flutter/core/app_color.dart';
import 'package:kakeibooo_flutter/feature/calendar/ui/calendar_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const SafeArea(
        child: ClipRRect(child: CalendarPage()),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BottomBarButton(
              icon: Icons.house_outlined,
              activeIcon: Icons.house,
              label: 'ホーム',
            ),
            BottomBarButton(
              icon: Icons.local_atm_outlined,
              activeIcon: Icons.local_atm,
              label: '家計簿',
              isSelected: true,
            ),
            BottomBarButton(
              icon: Icons.account_balance_outlined,
              activeIcon: Icons.account_balance,
              label: '通帳',
            ),
            BottomBarButton(
              icon: Icons.kitchen_outlined,
              activeIcon: Icons.kitchen,
              label: '冷蔵庫',
            ),
            BottomBarButton(
              icon: Icons.settings_outlined,
              activeIcon: Icons.settings,
              label: '設定',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(
            top: 16,
            bottom: bottomPadding > 0 ? bottomPadding : 8,
          ),
          // color: Colors.green,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Icon(
                    isSelected ? activeIcon : icon,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 1),
              Text(
                label,
                style: GoogleFonts.mPlusRounded1c(
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                textScaleFactor: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
