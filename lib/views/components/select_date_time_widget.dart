import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../utils/app_functions.dart';
import '../../utils/color_constant.dart';
import '../../view_models/artist_profile_view_model.dart';
import 'text_heading.dart';

class SelectDateTimeWidget extends StatelessWidget {
  const SelectDateTimeWidget(
      {super.key, required this.onOkayClick, required this.onCancelClick});

  final VoidCallback onOkayClick;
  final VoidCallback onCancelClick;

  @override
  Widget build(BuildContext context) {
    final ArtistProfileViewModel artistProfileViewModel = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextHeading(
                title: "Select your date",
                fontweight: FontWeight.w700,
                fontsize: 12.sp,
                fontcolor: Colors.white,
              ),
              IconButton(
                onPressed: () => artistProfileViewModel.selectDate(context),
                icon: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
              ),
              // DatePicker(
              //   DateTime.now(),
              //   initialSelectedDate: DateTime.now(),
              //   selectionColor: Colors.black,
              //   selectedTextColor: Colors.white,
              //   onDateChange: (date) {
              //     // New date selected
              //     // _selectedValue = date;
              //   },
              // ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 61.h,
            width: 340.w,
            decoration: BoxDecoration(
              color: AppColors.searchFieldsColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Stack(
              children: [
                Container(
                  height: 103,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Obx(
                    () => ScrollablePositionedList.builder(
                      itemScrollController:
                          artistProfileViewModel.getItemScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: artistProfileViewModel.getDates.length,
                      itemBuilder: (context, index) {
                        String date = artistProfileViewModel.getDates[index]
                            .substring(0, 2);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => artistProfileViewModel.onDateSelect(
                                artistProfileViewModel.getDates[index]),
                            child: Obx(
                              () => CircleAvatar(
                                backgroundColor: artistProfileViewModel
                                            .getSelectedDate ==
                                        artistProfileViewModel.getDates[index]
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                child: TextHeading(
                                  title: date,
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white,
                                ),
                              ),
                            ),
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
                ),
                Positioned(
                  top: 20.h,
                  left: 0,
                  child: InkWell(
                    onTap: () => artistProfileViewModel.onPreviousClick(),
                    child: Obx(
                      () => Container(
                        height: 24.h,
                        width: 24.w,
                        color: artistProfileViewModel.getDesiredItemIndex == 0
                            ? const Color(0xffC1C1C1)
                            : AppColors.primaryColor,
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
                ),
                Positioned(
                  top: 20.h,
                  right: 0,
                  child: InkWell(
                    onTap: () => artistProfileViewModel.onNextClick(),
                    child: Obx(
                      () => Container(
                        height: 24.h,
                        width: 24.w,
                        color: artistProfileViewModel.getDesiredItemIndex ==
                                artistProfileViewModel.getDates.length - 1
                            ? const Color(0xffC1C1C1)
                            : AppColors.primaryColor,
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
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
          Obx(
            () => TextHeading(
              title:
                  "Selected date: ${convertDate(artistProfileViewModel.getSelectedDate)}",
              fontweight: FontWeight.w700,
              fontsize: 12.sp,
              fontcolor: Colors.red,
            ),
          ),
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
                      title: "Available",
                      fontweight: FontWeight.w400,
                      fontsize: 10.sp,
                      fontcolor: Colors.white)
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  TextHeading(
                    title: "Selected",
                    fontweight: FontWeight.w400,
                    fontsize: 10.sp,
                    fontcolor: Colors.white,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 75.h,
            child: GetBuilder<ArtistProfileViewModel>(builder: (viewModel) {
              return viewModel.getIsSlotLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : GridView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: viewModel.getTimeSlots.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.h,
                        crossAxisSpacing: 5.w,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (context, index) {
                        String time = viewModel.getTimeSlots[index];
                        bool isBooked =
                            viewModel.getAppointedTimeSlots.contains(time);
                        return InkWell(
                          onTap: isBooked
                              ? null
                              : () {
                                  viewModel.setSelectedTime = time;
                                  viewModel.update();
                                },
                          child: Container(
                            height: 35.h,
                            width: 64.w,
                            decoration: BoxDecoration(
                              color: (isBooked
                                      ? Colors.red
                                      : time == viewModel.getSelectedTime
                                          ? AppColors.primaryColor
                                          : Colors.green)
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: TextHeading(
                                title: convertTimeRangeFormat(time),
                                fontweight: FontWeight.w400,
                                fontsize: 10.sp,
                                fontcolor: isBooked
                                    ? Colors.red
                                    : time == viewModel.getSelectedTime
                                        ? AppColors.primaryColor
                                        : Colors.green,
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }),
          ),

          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onOkayClick,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Center(
                  child: TextHeading(
                    title: "Okay",
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontcolor: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: onCancelClick,
                child: Container(
                  height: 23.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Center(
                    child: TextHeading(
                        title: "Cancel",
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                  ),
                ),
              ),
            ],
          )
          // Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.red.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.red),
          //           ),
          //         ),
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.green.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.green),
          //           ),
          //         ),
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.yellow.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.yellow),
          //           ),
          //         ),
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.green.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.green),
          //           ),
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       height: 5.h,
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.yellow.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.yellow),
          //           ),
          //         ),
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.green.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.green),
          //           ),
          //         ),
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.green.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.green),
          //           ),
          //         ),
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.yellow.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.yellow),
          //           ),
          //         ),
          //         Container(
          //           height: 35.h,
          //           width: 64.w,
          //           decoration: BoxDecoration(
          //               color: Colors.green.withOpacity(0.5),
          //               borderRadius: BorderRadius.circular(8.r)),
          //           child: Center(
          //             child: TextHeading(
          //                 title: "10:00 AM",
          //                 fontweight: FontWeight.w400,
          //                 fontsize: 10.sp,
          //                 fontcolor: Colors.green),
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
