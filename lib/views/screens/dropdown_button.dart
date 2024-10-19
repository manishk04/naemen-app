import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naemen/utils/app_url.dart';
import 'package:naemen/view_models/artist_profile_view_model.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/view_models/language_view_model.dart';

import '../../models/artist_service_model.dart';
import '../../utils/color_constant.dart';
import '../components/text_heading.dart';

class ExpansionTileControllerApp extends StatefulWidget {
  const ExpansionTileControllerApp({super.key, required this.services});

  final List<ArtistServiceModel> services;

  @override
  State<ExpansionTileControllerApp> createState() =>
      _ExpansionTileControllerAppState();
}

class _ExpansionTileControllerAppState
    extends State<ExpansionTileControllerApp> {
  final ArtistProfileViewModel artistProfileViewModel = Get.find();
  final CartViewModel cartViewModel = Get.find();
  final LanguageViewModel languageViewModel = Get.find();
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: widget.services.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(
            height: 15.h,
          ),
          itemBuilder: (context, index) {
            ArtistServiceModel service = widget.services[index];
            return Stack(
              children: [
                Container(
                  // height: 123.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if ((service.servicesImage ?? "").isNotEmpty)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: Colors.white),
                            ),
                            child: CachedNetworkImage(
                              height: 100.h,
                              width: 100.w,
                              imageUrl:
                                  "${AppUrl.baseUrl}/${service.servicesImage ?? ""}",
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error, color: Colors.red),
                              fit: BoxFit.cover,
                            ),
                          ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextHeading(
                                title: service.categoryTitle ?? "NA",
                                fontweight: FontWeight.w400,
                                fontsize: 16.sp,
                                fontcolor: Colors.white,
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              TextHeading(
                                title: languageViewModel.getSelectedLanguage ==
                                        "English"
                                    ? service.serviceDesEng ?? "NA"
                                    : service.serviceDesArb ?? "NA",
                                fontweight: FontWeight.w400,
                                fontsize: 11.sp,
                                fontcolor: Colors.white,
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          color: Colors.white,
                                          size: 14.sp,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        TextHeading(
                                          title:
                                              "${service.serviceDuration ?? 0} Min",
                                          fontweight: FontWeight.w600,
                                          fontsize: 12.sp,
                                          fontcolor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TextHeading(
                                      title:
                                          "\SAR ${service.serviceAmount ?? 0}",
                                      fontweight: FontWeight.w600,
                                      fontsize: 14.sp,
                                      fontcolor: Colors.white,
                                    ),
                                  ),
                                  Obx(
                                    () => InkWell(
                                      onTap: () => cartViewModel
                                              .getAddedServiceList
                                              .contains(service)
                                          ? artistProfileViewModel
                                              .onRemoveService(service)
                                          : artistProfileViewModel
                                              .onServiceAdd(service),
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.primaryColor,
                                        child: Icon(
                                          cartViewModel.getAddedServiceList
                                                  .contains(service)
                                              ? Icons.remove
                                              : Icons.add,
                                          size: 14.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // TextHeading(title: "Lorem Ipsum is simply dummy text of the\n printing and more", fontweight: FontWeight.w400, fontsize: 8.sp, fontcolor: Colors.white)
                            ],
                          ),
                        ),
                        //  Icon(Icons.menu,color: Colors.white,size: 12,)
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 10,
                //   right: 5,
                //   child:
                // ),
              ],
            );
          },
        ),
        // ExpansionTile(
        //   controller: controller,
        //   title: Text(
        //     "Option 1",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   children: [
        //     Container(
        //       height: 60.h,
        //       width: 340.w,
        //       decoration: BoxDecoration(
        //           border: Border.all(color: Colors.grey),
        //           borderRadius: BorderRadius.circular(16.r)),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           TextHeading(
        //               title: "1 Service added",
        //               fontweight: FontWeight.w600,
        //               fontsize: 14.sp,
        //               fontcolor: Colors.white),
        //           InkWell(
        //             onTap: () {
        //               _checkArtistAvailability();
        //               // Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointmentScreen()));
        //             },
        //             child: _isLoading
        //                 ? CircularProgressIndicator(
        //                     color: Colors.orange,
        //                   )
        //                 : Container(
        //                     height: 32.h,
        //                     width: 148.w,
        //                     decoration: BoxDecoration(
        //                         color: Colors.yellow.withOpacity(0.5),
        //                         borderRadius: BorderRadius.circular(8.r)),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                       children: [
        //                         TextHeading(
        //                             title: "Book appointment",
        //                             fontweight: FontWeight.w600,
        //                             fontsize: 12.sp,
        //                             fontcolor: Colors.white),
        //                         Icon(
        //                           Icons.arrow_forward_ios,
        //                           size: 15,
        //                           color: Colors.white,
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //           )
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       height: 20.h,
        //     ),
        //     ListView.separated(
        //       shrinkWrap: true,
        //       itemCount: widget.services.length,
        //       physics: const NeverScrollableScrollPhysics(),
        //       separatorBuilder: (context, index) => SizedBox(
        //         height: 15.h,
        //       ),
        //       itemBuilder: (context, index) {
        //         StoreServiceModel service = widget.services[index];
        //         return Stack(
        //           children: [
        //             Container(
        //               height: 123.h,
        //               // width: 320.w,
        //               decoration: BoxDecoration(
        //                   border: Border.all(color: Colors.grey),
        //                   borderRadius: BorderRadius.circular(16.r)),
        //               child: Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Row(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     if ((service.servicesImage ?? "").isNotEmpty)
        //                       Image.network(
        //                         "${AppUrl.baseUrl}/${service.servicesImage ?? ""}",
        //                       ),
        //                     SizedBox(
        //                       width: 10.w,
        //                     ),
        //                     Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         TextHeading(
        //                             title: service.categoryTitle ?? "NA",
        //                             fontweight: FontWeight.w400,
        //                             fontsize: 16.sp,
        //                             fontcolor: Colors.white),
        //                         SizedBox(
        //                           height: 5.h,
        //                         ),
        //                         TextHeading(
        //                             title: "${service.serviceAmount ?? 0}",
        //                             fontweight: FontWeight.w600,
        //                             fontsize: 18.sp,
        //                             fontcolor: Colors.white),
        //                         SizedBox(
        //                           height: 5.h,
        //                         ),
        //                         // TextHeading(title: "Lorem Ipsum is simply dummy text of the\n printing and more", fontweight: FontWeight.w400, fontsize: 8.sp, fontcolor: Colors.white)
        //                       ],
        //                     ),
        //                     //  Icon(Icons.menu,color: Colors.white,size: 12,)
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             Positioned(
        //               bottom: 10,
        //               right: 5,
        //               child: InkWell(
        //                 onTap: () => artistProfileViewModel.onServiceAdd(),
        //                 child: CircleAvatar(
        //                   radius: 15,
        //                   backgroundColor: Colors.yellow.withOpacity(0.6),
        //                   child: const Icon(
        //                     Icons.add,
        //                     color: Colors.white,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
