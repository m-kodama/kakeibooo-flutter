import 'package:flutter/material.dart';
import 'package:kakeibooo_flutter/core/app_color.dart';
import 'package:kakeibooo_flutter/feature/home/ui/home_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage>
    with SingleTickerProviderStateMixin {
  AnimationController? donutController;
  Animation<double>? rotateAnimation;

  @override
  void initState() {
    super.initState();
    donutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..repeat(reverse: true);

    rotateAnimation = Tween<double>(begin: 0, end: 0.1).animate(
      CurvedAnimation(
        parent: donutController!,
        curve: Curves.easeIn,
      ),
    );

    Future.delayed(const Duration(milliseconds: 2400), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: RotationTransition(
          turns: rotateAnimation!,
          child: Icon(
            Icons.savings_outlined,
            size: 128,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    donutController?.dispose();
    super.dispose();
  }
}
