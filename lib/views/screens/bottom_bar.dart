import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/views/screens/appointment_history.dart';

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
          children: const [
            HomeView(),
            AppointmentHIstoreyPage(),
            MyBagScreen()
          ],
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
          borderRadius: BorderRadius.circular(20),
          unselectedIconColor: Colors.white,
          padding: EdgeInsets.all(3),
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.fill,
          inkColor: AppColors.primaryColor.withOpacity(0.5),
          opacity: 0.3,
        ),
        // iconSpace: 5.0,
        items: [
          BottomBarItem(
            icon: Icon(
              Icons.home_outlined,
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
            //   badgeColor: Colors.red,

            icon: const Icon(Icons.bookmark_border_outlined),
            title: const Text('Bookmark'),
            backgroundColor: AppColors.primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
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

//----->>>> second Navbar<<<<<<----------

class ExampleNavbarView extends StatefulWidget {
  @override
  _ExampleNavbarViewState createState() => _ExampleNavbarViewState();
}

class _ExampleNavbarViewState extends State<ExampleNavbarView> {
  int _selectedIndex = 0;
  PageController controller = PageController(initialPage: 0);

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

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    AppointmentHIstoreyPage(),
    MyBagScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75),
          color: AppColors.bottomBarColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: GNav(
            rippleColor: AppColors.primaryColor!,
            hoverColor: AppColors.primaryColor!,
            gap: 8,
            activeColor: AppColors.primaryColor,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: AppColors.primaryColor.withOpacity(0.5),
            color: AppColors.primaryColor,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.bookmark_outline_outlined,
                text: 'Bookmark',
              ),
              GButton(
                icon: Icons.calendar_month_outlined,
                text: 'Calender',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
