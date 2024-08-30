import 'package:flutter/material.dart';
import 'package:naemen/utils/color_constant.dart';

import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'bookmark_screen.dart';
import 'home_page.dart';
import 'mybag_screen.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});
  // final String address;

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;
  // late String _address;
  @override
  void initState() {
    super.initState();
    // widget.address;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView(
          clipBehavior: Clip.antiAlias,
          controller: controller,
          children: const [HomeView(), MyScendScreen(), MyBagScreen()],
          onPageChanged: (value) => setState(() {
            selected = value;
            controller.jumpToPage(value);
          }),
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        elevation: 3, borderRadius: BorderRadius.circular(20),
        backgroundColor: AppColors.bottomBarColor,
        option: BubbleBarOptions(
          inkEffect: true,
          borderRadius: BorderRadius.circular(20),
          unselectedIconColor: Colors.white,
          padding: EdgeInsets.all(8),
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.outlined,
          inkColor: AppColors.primaryColor.withOpacity(0.5),
          opacity: 0.3,
        ),
        // iconSpace: 5.0,
        items: [
          BottomBarItem(
            icon: Icon(
              Icons.home,
              color: selected == 0 ? AppColors.primaryColor : Colors.white,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            // backgroundColor: AppColors.primaryColor,
          ),
          BottomBarItem(
         //   badgeColor: Colors.red,

            icon: const Icon(Icons.bookmark),
            title: const Text('Bookmark'),
            backgroundColor: AppColors.primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_bag),
            title: const Text(
              'Bag',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            backgroundColor: AppColors.primaryColor,
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
