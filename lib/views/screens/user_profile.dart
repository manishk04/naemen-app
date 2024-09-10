// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:naemen/models/artist_service_model.dart';
// import 'package:naemen/view_models/artist_profile_view_model.dart';
// import 'package:naemen/view_models/cart_view_model.dart';
// import 'package:naemen/view_models/language_view_model.dart';
// import 'package:naemen/views/components/appointment_filter.dart';
// import 'package:naemen/views/components/booking_dattime_widget.dart';
// import 'package:naemen/views/components/image_picker.dart';
// import 'package:naemen/views/components/search_bar.dart';
// import 'package:naemen/views/screens/notification_page.dart';
// import 'package:naemen/views/screens/shop_page.dart';
// import 'package:naemen/utils/color_constant.dart';

// import '../components/text_heading.dart';

// class UserProfilePage extends StatefulWidget {
//   const UserProfilePage({super.key});

//   @override
//   State<UserProfilePage> createState() => _UserProfilePageState();
// }

// class _UserProfilePageState extends State<UserProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     LanguageViewModel languageViewModel = Get.find();
//     CartViewModel cartViewModel = Get.find();
//     ArtistProfileViewModel artistProfileViewModel = Get.find();
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(50.0),
//         child: AppBar(
//           backgroundColor: Colors.black,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           title: TextHeading(
//               title: "MD.Arshloon Profile",
//               fontweight: FontWeight.w700,
//               fontsize: 14.sp,
//               fontcolor: Colors.white),
//           centerTitle: true,
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Colors.black,
//           child: Column(
//             children: [
//               //ImagePickerExample(),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.person_outline,
//               //     color: AppColors.primaryColor,
//               //   ),
//               //   title: TextHeading(
//               //       title: "My Profile",
//               //       fontweight: FontWeight.w400,
//               //       fontsize: 12,
//               //       fontcolor: Colors.white),
//               //   trailing: Icon(
//               //     Icons.arrow_forward_ios,
//               //     size: 15,
//               //     color: AppColors.primaryColor,
//               //   ),
//               // ),
//               // Divider(
//               //   thickness: 0.1,
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.favorite,
//               //     color: AppColors.primaryColor,
//               //   ),
//               //   title: TextHeading(
//               //       title: "My favorite",
//               //       fontweight: FontWeight.w400,
//               //       fontsize: 12,
//               //       fontcolor: Colors.white),
//               //   trailing: Icon(
//               //     Icons.arrow_forward_ios,
//               //     size: 15,
//               //     color: AppColors.primaryColor,
//               //   ),
//               // ),
//               // Divider(
//               //   thickness: 0.1,
//               // ),
//               // ListTile(
//               //     leading: Icon(
//               //       Icons.balance,
//               //       color: AppColors.primaryColor,
//               //     ),
//               //     title: TextHeading(
//               //         title: "Aviliable  Balance",
//               //         fontweight: FontWeight.w400,
//               //         fontsize: 12,
//               //         fontcolor: Colors.white),
//               //     trailing: TextHeading(
//               //         title: "120.00 SAR",
//               //         fontweight: FontWeight.w700,
//               //         fontsize: 16,
//               //         fontcolor: AppColors.primaryColor)),
//               // Divider(
//               //   thickness: 0.1,
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.notifications,
//               //     color: AppColors.primaryColor,
//               //   ),
//               //   title: TextHeading(
//               //       title: "Get Notification",
//               //       fontweight: FontWeight.w400,
//               //       fontsize: 12,
//               //       fontcolor: Colors.white),
//               //   trailing: Icon(
//               //     Icons.arrow_forward_ios,
//               //     size: 15,
//               //     color: AppColors.primaryColor,
//               //   ),
//               // ),
//               // Divider(
//               //   thickness: 0.1,
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.share,
//               //     color: AppColors.primaryColor,
//               //   ),
//               //   title: TextHeading(
//               //       title: "Refer and earn",
//               //       fontweight: FontWeight.w400,
//               //       fontsize: 12,
//               //       fontcolor: Colors.white),
//               //   trailing: Icon(
//               //     Icons.arrow_forward_ios,
//               //     size: 15,
//               //     color: AppColors.primaryColor,
//               //   ),
//               // ),
//               // Divider(
//               //   thickness: 0.1,
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.key,
//               //     color: AppColors.primaryColor,
//               //   ),
//               //   title: TextHeading(
//               //       title: "Change Password",
//               //       fontweight: FontWeight.w400,
//               //       fontsize: 12,
//               //       fontcolor: Colors.white),
//               //   trailing: Icon(
//               //     Icons.arrow_forward_ios,
//               //     size: 15,
//               //     color: AppColors.primaryColor,
//               //   ),
//               // ),
//               // Divider(
//               //   thickness: 0.1,
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.privacy_tip,
//               //     color: AppColors.primaryColor,
//               //   ),
//               //   title: TextHeading(
//               //       title: "Privacy Policy",
//               //       fontweight: FontWeight.w400,
//               //       fontsize: 12,
//               //       fontcolor: Colors.white),
//               //   trailing: Icon(
//               //     Icons.arrow_forward_ios,
//               //     size: 15,
//               //     color: AppColors.primaryColor,
//               //   ),
//               // ),
//               // Divider(
//               //   thickness: 0.1,
//               // ),
//               ListTile(
//                 leading: Icon(
//                   Icons.info,
//                   color: AppColors.primaryColor,
//                 ),
//                 title: TextHeading(
//                     title: "About Us",
//                     fontweight: FontWeight.w400,
//                     fontsize: 12,
//                     fontcolor: Colors.white),
//                 trailing: Icon(
//                   Icons.arrow_forward_ios,
//                   size: 15,
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               Divider(
//                 thickness: 0.1,
//               ),
//               ListTile(
//                 leading: Icon(
//                   Icons.logout,
//                   color: AppColors.primaryColor,
//                 ),
//                 title: TextHeading(
//                     title: "Logout",
//                     fontweight: FontWeight.w400,
//                     fontsize: 12,
//                     fontcolor: Colors.white),
//                 trailing: Icon(
//                   Icons.arrow_forward_ios,
//                   size: 15,
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               Divider(
//                 thickness: 0.1,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
