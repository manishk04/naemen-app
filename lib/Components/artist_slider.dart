
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/utils/color_constant.dart';


class ArtistSlider extends StatefulWidget {
  const ArtistSlider(
      {super.key,
    //   required this.status,
    // required this.statuValue,
    // required this.description,
    // required this.type,
    // required this.typeValue,
      
   
    //   required this.image
      });

  
  // final String image;
  //   final String status;
  // final String statuValue;
  // final String description;
  // final String type;
  // final String typeValue;

  @override
  State<ArtistSlider> createState() => _ArtistSliderState();
}

  final List<String> artistImages = [
    "assets/images/artistImage1.jpeg",
    "assets/images/artistImage2.jpeg",
    "assets/images/artistImage3.jpeg"
    
  ];
   final List<String> artistNames = [
    "Abdulaziz",
    "Mohammad",
    "Ahmed"
    
  ];

    final List<String> artistWorkat= [
    "Last Touch",
    "9 Cutes",
    "Bros Salon"
    
  ];

  


class _ArtistSliderState extends State<ArtistSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(


        height: 255.h,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: artistImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return  Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 252.h,
          width: 200.w,
          decoration: BoxDecoration(
            color: AppColors.SearchfieldsColor  ,

            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.SignupColor)),

        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5  ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h,),
              Expanded(
                flex: 4,
                child: Container(

                  width: 190.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                          image: AssetImage(artistImages[index]), fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 5.h,),
                   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextHeading(
                              title: artistNames[index],
                              fontweight: FontWeight.w600,
                              fontsize: 12.sp,
                              fontcolor: Colors.white,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.primarycolor,
                                ),
                                SizedBox(width: 3),
                                TextHeading(
                                  title: "4.3/5",
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),


                    SizedBox(
                      height: 3.h,
                    ),

                      Row(
                          children: [
                            TextHeading(
                              title: "Work at",
                              fontweight: FontWeight.w400,
                              fontsize: 12.sp,
                              fontcolor: Colors.white,
                            ),
                            SizedBox(width: 3.w),
                            TextHeading(
                              title: artistWorkat[index],
                              fontweight: FontWeight.w400,
                              fontsize: 12.sp,
                              fontcolor: AppColors.primarycolor,
                            ),
                          ],
                        ),
                    SizedBox(height: 3.h
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/location-svgrepo-com 1.png",color: AppColors.primarycolor,),
                        TextHeading(title: "0.4 km", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white)

                      ],
                    ),

                    SizedBox(height: 5.h,),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 34.h,
                          width: 34.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Center(child: Icon(Icons.bookmark_add_outlined,color: Colors.white,)),

                        ),
                        SizedBox(width: 50.w,),

                        Container(
                          height: 34.h,
                          width: 102.w,
                          decoration: BoxDecoration(
                            color: AppColors.bookmarlColor,
                            borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Center(child: TextHeading(title: "View Profile", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white ))

                        )
                      ],
                    )


                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
            }));
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:naemen/Components/text_heading.dart';
// import 'package:naemen/utils/color_constant.dart';

// class ArtistSliderWidget extends StatefulWidget {
//   const ArtistSliderWidget({super.key,});

//   @override
//   State<ArtistSliderWidget> createState() => _ArtistSliderWidgetState();
// }

// class _ArtistSliderWidgetState extends State<ArtistSliderWidget> {
//   final List<String> artistImages = [
//     "assets/images/artistImage1.jpeg",
//     "assets/images/artistImage2.jpeg",
//     "assets/images/artistImage3.jpeg"
//      "assets/images/artistImage3.jpeg"
     
//       "assets/images/artistImage3.jpeg"
//        "assets/images/artistImage3.jpeg"
//   ];

//   final List<String> artistNames = [
//     "Abdulaziz",
//     "Mohammad",
//     "Ahmed"
//     "Artist1"
//     "Artist2"
//     "Artist3"
//   ];
//   final List<String> artistWorkat= [
//     "Last Touch",
//     "9 Cutes",
//     "Bros Salon"
//     "Nail Pavillion"
//     "Secret care"
//     "AI Rayan"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 255.h,
//       width: double.infinity,
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: artistImages.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return  Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.only(right: 10),
//           height: 252.h,
//           width: 200.w,
//           decoration: BoxDecoration(
//             color: AppColors.SearchfieldsColor,
//             borderRadius: BorderRadius.circular(16.r),
//             border: Border.all(color: AppColors.SignupColor),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(right: 10),
//           height: 252.h,
//           width: 200.w,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16.r),
//             border: Border.all(color: AppColors.primarycolor),
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 3.h),
//               Expanded(
//                 flex: 5,
//                 child: Container(
//                   width: 190.w,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.r),
//                     image: DecorationImage(
//                       image: AssetImage(artistImages[index]),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 6,
//                 child: Container(
//                   decoration: const BoxDecoration(),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TextHeading(
//                               title: artistNames[index],
//                               fontweight: FontWeight.w600,
//                               fontsize: 12.sp,
//                               fontcolor: Colors.white,
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   color: AppColors.primarycolor,
//                                 ),
//                                 SizedBox(width: 3),
//                                 TextHeading(
//                                   title: "4.3/5",
//                                   fontweight: FontWeight.w600,
//                                   fontsize: 12.sp,
//                                   fontcolor: Colors.white,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 3.h),
//                         // TextHeading(
//                         //   title: description,
//                         //   fontweight: FontWeight.w600,
//                         //   fontsize: 12.sp,
//                         //   fontcolor: Colors.white,
//                         // ),
//                         Row(
//                           children: [
//                             TextHeading(
//                               title: "Work at",
//                               fontweight: FontWeight.w400,
//                               fontsize: 12.sp,
//                               fontcolor: Colors.white,
//                             ),
//                             SizedBox(width: 3.w),
//                             TextHeading(
//                               title: artistWorkat[index],
//                               fontweight: FontWeight.w400,
//                               fontsize: 12.sp,
//                               fontcolor: AppColors.primarycolor,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 3.h),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.location_pin,
//                               color: AppColors.primarycolor,
//                             ),
//                             TextHeading(
//                               title: "0.4 km",
//                               fontweight: FontWeight.w400,
//                               fontsize: 12.sp,
//                               fontcolor: Colors.white,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5.h),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               height: 34.h,
//                               width: 34.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(8.r),
//                               ),
//                               child: Center(
//                                 child: Icon(
//                                   Icons.bookmark_add_outlined,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 34.h,
//                               width: 102.w,
//                               decoration: BoxDecoration(
//                                 color: AppColors.bookmarlColor,
//                                 borderRadius: BorderRadius.circular(8.r),
//                               ),
//                               child: Center(
//                                 child: TextHeading(
//                                   title: "View Profile",
//                                   fontweight: FontWeight.w400,
//                                   fontsize: 12.sp,
//                                   fontcolor: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//         },
//       ),
//     );
//   }
// }

// // class WinterspecialItems extends StatelessWidget {
// //   const WinterspecialItems({
// //     super.key,
// //     required this.image,
// //     required this.description,
// //     required this.descriptiondetail,
// //     required this.name,
// //   });

// //   final String image;
// //   final String name;
// //   final String description;
// //   final String descriptiondetail;

// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //   }
// // }
