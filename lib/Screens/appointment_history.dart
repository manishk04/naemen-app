import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/appointment_filter.dart';
import 'package:naemen/Components/reusable_row.dart';
import 'package:naemen/Components/search_bar.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/shopPage.dart';
import 'package:naemen/utils/color_constant.dart';


class AppointmentHIstoreyPage extends StatefulWidget {
  const AppointmentHIstoreyPage({super.key});

  @override
  State<AppointmentHIstoreyPage> createState() => _AppointmentHIstoreyPageState();
}

class _AppointmentHIstoreyPageState extends State<AppointmentHIstoreyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar( backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primarycolor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: TextHeading(
              title: "Appointment History",
              fontweight: FontWeight.w700,
              fontsize: 14.sp,
              fontcolor: Colors.white),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
              
                  
             
              Divider(
                color: AppColors.primarycolor,
              ),
              SizedBox(
                height: 10.h,
              ),
                  
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SearchBarWidget(
                        hinttexttitle: "Search your appointment... "),
                  
                    SizedBox(
                      height: 20.h,
                    ),
                    AppointmentFilter(),
                  
                    Container(
                      height: 500.h,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              height: 200.h,  
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  border:
                                      Border.all(color: AppColors.SignupColor,width: 0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                
                                children: [
                                  Row(
                                   //mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                            
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopPage()));
                                              },
                                              child: Container(
                                                height: 120.h,
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(image: AssetImage("assets/images/saloon_detail _image.jpeg",),fit: BoxFit.cover),
                                                  color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(15.r)),
                                                        
                                              ),
                                            ),
                                          ),
                                        
                                        ],
                                      ),
                
                                    SizedBox(width: 10.w,),
                                      Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          TextHeading(title: "The Stars Baerber", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: AppColors.primarycolor),
                                          SizedBox(height: 10.w,),
                                          Row(
                                            children: [
                                              Image.asset("assets/images/mark_Location.png"),
                                              SizedBox(width: 4.w,),
                                             // Icon(Icons.location_city,color: Colors.white,),
                                              TextHeading(title: "3.5 Km From you", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white)
                                            
                                            
                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          TextHeading(title: "04 Apr,2024 at 02:00 PM - 03:00 PM", fontweight: FontWeight.w400, fontsize: 8.sp, fontcolor: AppColors.primarycolor),
                                        
                                          SizedBox(height: 10.h,),
                                          Row(
                                            children: [
                                              TextHeading(title: "Artist Name:", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white),
                                              TextHeading(title: " Artist1", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: AppColors.bookmarlColor)
                                            
                                            
                                            ],
                                          )
                                            
                                            
                                        ],
                                      ),
                                   
                                      Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.primarycolor,size: 15,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                TextHeading(
                                                    title: "4.3/5",
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 10.sp,
                                                    fontcolor: Colors.white)
                                              ],
                                            ),
                
                                    ],
                                  ),
                                  SizedBox(height: 15.h,),

                                  Divider(thickness: 0.5,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:10 ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: TextHeading(title: "View Orders >", fontweight: FontWeight.w400, fontsize: 10.sp, fontcolor: AppColors.primarycolor)),
                                        Expanded(
                                          child: Container(
                                            height: 
                                            24,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.r),
                                              border: Border.all(width: 0.5,color: AppColors.SignupColor),
                                              
                                                                              
                                            ),
                                            child: Image.asset("assets/images/location3.png"),
                                          ),
                                        ),
                                        SizedBox(width: 10.w,),
                                      
                                        InkWell(
                                          child: Container(
                                            height: 
                                            23.h,
                                            width: 72.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.r),
                                              border: Border.all(color: AppColors.upcommingColor)),
                                            child: Center(
                                              child: TextHeading(title: "Upcomming", fontweight: FontWeight.w400, fontsize: 10.sp, fontcolor: AppColors.upcommingColor),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            
              ],
            ),
          ),
        
        ),
      )
       
      
         
      
      
         
     
          // Row(
      //   children: [
      //     SearchBarWidget(hinttexttitle: 'Search Your Favorite hair expert...',),
      //     Icon(Icons.filter,color: AppColors.primarycolor,)
      //   ],
      // ),
      // SizedBox(height: 20.h,),
      // const  ReUsableRow(),
      // SizedBox(height: 20.h,),
      //
      // Container(height: 500.h,
      // width: double.infinity,
      //   child: ListView.builder(
      //     itemCount: 10,
      //     itemBuilder: (BuildContext context, int index) {
      //       return  Container(
      //         height: 150.h,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //             color: AppColors.SignupColor,
      //             border: Border.all(color: AppColors.primarycolor),
      //             borderRadius: BorderRadius.circular(20)),
      //         child: Row(
      //           children: [
      //             Stack(
      //               children: [
      //                 Container(
      //                   height: 70.h,
      //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      //                 ),
      //
      //                 Row(
      //                   children: [
      //                     Icon(Icons.star,color: AppColors.primarycolor,),
      //                     SizedBox(width: 3.w,),
      //                     TextHeading(title: "4.3/5", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white)
      //
      //                   ],
      //                 )
      //               ],
      //             )
      //
      //           ],
      //         ),
      //       );
      //     },
      //   ),
      //
      //
      //
      //
      //
      //
      //
      //
      //
      // ),
        
      );
    
  }
}
