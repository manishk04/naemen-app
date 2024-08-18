import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/dropdown_button.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../Components/newely_added.dart';

class ArtistProfileService extends StatefulWidget {
  const ArtistProfileService({super.key});

  @override
  State<ArtistProfileService> createState() => _ArtistProfileServiceState();
}

class _ArtistProfileServiceState extends State<ArtistProfileService> {

  List number = ["1","2","3","5"];


    final List<String> _myList = List.generate(6, (i) => "Item $i");
  final ItemScrollController _itemScrollController = ItemScrollController();

   void _scrollToIndex(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }

  int desiredItemIndex = 0;
  int currentindex = 0;
  
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow.withOpacity(0.6),
                        radius: 15,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextHeading(
                        title: "Artist Profile and Services",
                        fontweight: FontWeight.w700,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.yellow.withOpacity(0.6),
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  height: 134.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: AppColors.SearchfieldsColor,
                      border: Border.all(color: AppColors.SignupColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                            "assets/images/artist_profileimage.png"),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading(
                                title: "Yusuf Ansari",
                                fontweight: FontWeight.w700,
                                fontsize: 14.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.primarycolor,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextHeading(
                                    title: "4.3/5",
                                    fontweight: FontWeight.w700,
                                    fontsize: 10.sp,
                                    fontcolor: Colors.white)
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                TextHeading(
                                    title: "Work at:",
                                    fontweight: FontWeight.w600,
                                    fontsize: 12.sp,
                                    fontcolor: Colors.white),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextHeading(
                                    title: " nspirations Salons",
                                    fontweight: FontWeight.w600,
                                    fontsize: 12.sp,
                                    fontcolor: AppColors.primarycolor),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                    "assets/images/mark_Location.png"),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextHeading(
                                    title: "3.5 Km From you",
                                    fontweight: FontWeight.w400,
                                    fontsize: 12.sp,
                                    fontcolor: Colors.white)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                



                TextHeading(
                    title: "Select your date",
                    fontweight: FontWeight.w700,
                    fontsize: 12.sp,
                    fontcolor: Colors.white),
                SizedBox(
                  height: 15.h,
                ),
                 Container(
                  height: 61.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: AppColors.SearchfieldsColor,
                    borderRadius: BorderRadius.circular(8.r)),
                   child: Stack(
                          children: [
                            SizedBox(
                              height: 103,
                              child: ScrollablePositionedList.builder(
                                itemScrollController: _itemScrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount:30, 
                                //_myList.length,
                                itemBuilder: (context, index) {

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.primarycolor,
                                      child:
                                      
                                       TextHeading(title: "24", fontweight: FontWeight.w600, fontsize: 12.sp, fontcolor: Colors.white),


                                    ),
                                  );
                                  // return Container(
                                  //   height: 103.h,
                                  //   width: 103.w,
                                  //   key: ValueKey(_myList[index]),
                                  //   margin: const EdgeInsets.all(10),
                                  //   decoration: BoxDecoration(
                                  //       border: Border.all(color: Colors.grey),
                                  //       image: const DecorationImage(
                                  //           image: AssetImage(
                                  //             "assets/images/sweatshirts.png",
                                  //           ),
                                  //           fit: BoxFit.contain)),
                                  // );
                                },
                              ),
                            ),
                            Positioned(
                              top: 20.h,
                              left: 0,
                              child: InkWell(
                                onTap: () {
                                  if (desiredItemIndex != 0) {
                                    setState(() {
                                      desiredItemIndex = desiredItemIndex - 1;
                                    });
                                    _scrollToIndex(desiredItemIndex);
                                  }
                                },
                                child: Container(
                                  height: 24.h,
                                  width: 24.w,
                                  color: desiredItemIndex == 0
                                      ? const Color(0xffC1C1C1)
                                      : AppColors.primarycolor,
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20.h,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  if (desiredItemIndex < _myList.length - 1) {
                                    setState(() {
                                      desiredItemIndex = desiredItemIndex + 1;
                                    });
                                    _scrollToIndex(desiredItemIndex);
                                  }
                                },
                                child: Container(
                                  height: 24.h,
                                  width: 24.w,
                                  color: desiredItemIndex == _myList.length - 2
                                      ? const Color(0xffC1C1C1)
                                      : AppColors.primarycolor,
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                 ),




                // Container(
                //   height: 100.h,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(8.r),
                //   ),
                //   child: SingleChildScrollView(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         DatePicker(
                //           DateTime.now(),
                //           initialSelectedDate: DateTime.now(),
                //           selectionColor: Colors.black,
                //           selectedTextColor: Colors.white,
                //           onDateChange: (date) {
                //             // New date selected
                //             setState(() {
                //               _selectedValue = date;
                //             });
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeading(
                        title: "Timing",
                        fontweight: FontWeight.w700,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        TextHeading(
                            title: "Booked",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.white)
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.green,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        TextHeading(
                            title: "Aviliable",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.white)
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.green,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        TextHeading(
                            title: "Selected",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.white)
                      ],
                    )
                  ],
                ),
      
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.red),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.green),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.green),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.yellow),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.green),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.yellow),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.green),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.green),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.yellow),
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: TextHeading(
                                title: "10:00 AM",
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: Colors.green),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextHeading(
                    title: "Services",
                    fontweight: FontWeight.w700,
                    fontsize: 12.sp,
                    fontcolor: Colors.white),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 650.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: AppColors.SearchfieldsColor,
                      border: Border.all(color: AppColors.SignupColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        TextHeading(
                            title: "Hair",
                            fontweight: FontWeight.w600,
                            fontsize: 12,
                            fontcolor: Colors.white),
                        SizedBox(height: 10.h,),
      
                       ExpansionTileControllerApp(),
      
      
      
                       // DropdownButtonPage()
      
      
                      ],
                    ),
                  ),
                ),
      
                SizedBox(height: 20.h,),
                TextHeading(title: "Recommended Artists", fontweight: FontWeight.w700, fontsize: 12.sp, fontcolor: Colors.white),SizedBox(height: 20.h,),
                const NewelyWidget(
                  status: "Status:",
                  description: 'Chameleon salon',
                  type: 'Saloon Type:',
                  image: 'assets/images/newly.png',
                  statuValue: 'ONLINE',
                  typeValue: 'Unisex',
                ),
                SizedBox(height: 20.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
