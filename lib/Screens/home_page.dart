import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naemen/Components/artist_slider.dart';
import 'package:naemen/Components/crousel_slider.dart';
import 'package:naemen/Components/newely_added.dart';
import 'package:naemen/Components/recommended.dart';
import 'package:naemen/Components/reusable_row.dart';
import 'package:naemen/Components/search_bar.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/category_page.dart';
import 'package:naemen/utils/image_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.address,
  });
  final String address;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _address;

  @override
  void initState() {
    super.initState();
    _address = widget.address;
  }

  @override
  void dispose() {
    // Perform any necessary cleanup
    super.dispose();
  }

  List tradingimages = [
    ImageConstant.tradingImage,
    ImageConstant.tradingImage,
    ImageConstant.tradingImage,
    ImageConstant.tradingImage,
  ];

  PageController pageController1 = PageController();
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black
                // image: DecorationImage(
                //     image: AssetImage(
                //         "assets/images/abstract-geometric-background-shapes-texture 1.png"),
                //     fit: BoxFit.cover)
                ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [Image.asset("assets/images/Location.png"),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 3.w),
                            TextHeading(
                              title: "Home",
                              fontweight: FontWeight.w600,
                              fontsize: 12.sp,
                              fontcolor: isDark ? Colors.white : Colors.white,
                            ),
                            Text(
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11.sp,color: Colors.white),
                              widget.address)
                            // TextHeading(
                              
                            //   title: widget.address   ,
                            //   fontweight: FontWeight.w400,
                            //   fontsize: 11.sp,
                            //   fontcolor: Colors.white,
                            // ),
                          ],
                        ),
                        ]),
                       
                        //       Switch(
                        //   value: AdaptiveTheme.of(context).mode.isDark,
                        //   onChanged: (value) {
                        //     if (value) {
                        //       AdaptiveTheme.of(context).setDark();
                        //     } else {
                        //       AdaptiveTheme.of(context).setLight();
                        //     }
                        //   },
                        // ),
                      //  SizedBox(width: 1.w),
                        const CircleAvatar(
                          radius: 17.5,
                          backgroundImage:
                              AssetImage("assets/images/profile_image.png"),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    // SearchBarWidget(
                    //   hinttexttitle: "Search your favorite hair expert...",
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    HomePageSlider(
                      pageController1: pageController1,
                      tradingimages: tradingimages,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextHeading(
                              title: "Categories",
                              fontweight: FontWeight.w600,
                              fontsize: 12.sp,
                              fontcolor: Colors.white),
                          TextHeading(
                              title: "View all",
                              fontweight: FontWeight.w400,
                              fontsize: 10.sp,
                              fontcolor: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ReUsableRow(),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextHeading(
                        title: "Newly Added Saloons",
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                    SizedBox(
                      height: 25.h,
                    ),
                    const NewelyWidget(
                      status: "Status:",
                      description: 'Chameleon salon',
                      type: 'Saloon Type:',
                      image: 'assets/images/newly.png',
                      statuValue: 'ONLINE',
                      typeValue: 'Unisex',
                    ),
                    SizedBox(height: 20.h),
                    TextHeading(
                        title: "Top Rated Artist",
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                    SizedBox(
                      height: 25.h,
                    ),
                    ArtistSlider(),

                    // const NewelyWidget(
                    //   status: "Status:",
                    //   description: 'Chameleon salon',
                    //   type: 'Saloon Type:',
                    //   image: 'assets/images/newly.png',
                    //   statuValue: 'ONLINE',
                    //   typeValue: 'Unisex',
                    // ),
                   // ArtistSlider(status: 'Status', statuValue: 'Online', description: '2q4qrw', type: 'rewrwr', typeValue: 'wdad', image: 'assets/images/newly.png',),

                    //ArtistSliderWidget( ),
                  
                    SizedBox(
                      height: 20.h,
                    ),
                    TextHeading(
                        title: "Recommended",
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                    SizedBox(
                      height: 20.h,
                    ),
                    Recommended(
                      status: "Status:",
                      description: 'Chameleon salon',
                      type: 'Saloon Type:',
                      image: 'assets/images/newly.png',
                      statuValue: 'ONLINE',
                      typeValue: 'Unisex',
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
