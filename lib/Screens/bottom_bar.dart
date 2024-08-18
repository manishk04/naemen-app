import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naemen/Screens/bookmark_screen.dart';
import 'package:naemen/Screens/home_page.dart';
import 'package:naemen/Screens/mybag_screen.dart';
import 'package:naemen/utils/color_constant.dart';

import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BubbelBarExample extends StatefulWidget {
  const BubbelBarExample({super.key});

  @override
  State<BubbelBarExample> createState() => _BubbelBarExampleState();
}

class _BubbelBarExampleState extends State<BubbelBarExample> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        clipBehavior: Clip.antiAlias,
        controller: controller,
        children: const [
          HomePage(
            address: '',
          ),
          MyScendScreen(),
          MyBagScreen()
        ],
      ),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.outlined,
          inkColor: AppColors.primarycolor,
          // bubbleFillStyle: BubbleFillStyle.outlined,
          opacity: 0.3,
        ),
        // iconSpace: 5.0,
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.home,
              color: AppColors.primarycolor,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: AppColors.primarycolor),
            ),
            // backgroundColor: AppColors.primarycolor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.bookmark),
            title: const Text('Bookmark'),
            backgroundColor: AppColors.primarycolor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_bag),
            title: const Text(
              'Bag',
              style: TextStyle(color: AppColors.primarycolor),
            ),
            backgroundColor: AppColors.primarycolor,
          ),
        ],
        hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
    );
  }
}
