import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/appointment_history.dart';
import 'package:naemen/utils/color_constant.dart';

  class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
               SizedBox(height: 15.h,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 15.h,
                        backgroundColor: Colors.yellow.withOpacity(0.6),
                        child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,),
                        ),
                      ],
                    ),
                  ),
                ),
              
                SizedBox(height: 30.h,),
                
                    Center(child: Image.asset("assets/images/orderImage.png")),
                    SizedBox(height: 20.h,),
                    Center(child: TextHeading(title: "Let's Get You\n    Groomed", fontweight: FontWeight.w800, fontsize: 20.sp, fontcolor: AppColors.primarycolor)),
                    SizedBox(height: 10.h,),
                      TextHeading(title: "Congratulations! Your appoinment has been successfully booked.Thank you for choosing us looking forward to see you on time on your appoinment. Drive safe", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white),
                      SizedBox(height: 20.h,),
                        Container(
                  height: 84.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: AppColors.SearchfieldsColor,
                    border: Border.all(color: AppColors.SignupColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextHeading(title: "Date & Timing: ", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: Colors.white),
                            TextHeading(title: "Sunday, 07 Apr - 12:00PM", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            TextHeading(title: "Artist: ", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: Colors.white),
                            TextHeading(title: "Abdulazeez", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            TextHeading(title: "Gender: ", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: Colors.white),
                            TextHeading(title: "Male", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,)
            
            
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Container(
                  height: 160.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: AppColors.SearchfieldsColor,
                      border: Border.all(color: AppColors.SignupColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextHeading(title: "Services", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                          
                            Expanded(
                              
                              child: TextHeading(title: "Price", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 5.h,),
                        const Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextHeading(title: "Hair Cut", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                          
                           
                            Expanded(
                              
                              child: TextHeading(title: "SAR 90", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                       const Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextHeading(title: "Beard", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                           
                           
                            Expanded(
                              
                              child: TextHeading(title: "SAR 79", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                     const Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextHeading(title: "Facial and wax", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                           
                            Expanded(
                             
                              child: TextHeading(title: "SAR 40", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                     const Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextHeading(title: "Beard Trim", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                           
                           
                            Expanded(
                              
                              child: TextHeading(title: "SAR 190", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
            
            
            
            
            
            
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                      Container(
                  height: 84.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: AppColors.SearchfieldsColor,
                    border: Border.all(color: AppColors.SignupColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextHeading(title: "convenience ", fontweight: FontWeight.w400, fontsize: 13
                                  , fontcolor: Colors.white),
                            ),
                            TextHeading(title: "SAR 05", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        const Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextHeading(title: "Sub Total", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                            TextHeading(title: "SAR 95", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        const Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextHeading(title: "Coupon Discount", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                            TextHeading(title: "SAR 72", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,)
            
            
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                InkWell(
                  // onTap: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointmentHIstoreyPage()));
                  // },
                  child: Container(height: 40.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: AppColors.primarycolor,
                    
                    borderRadius: BorderRadius.circular(8.r)),
                    child: Center(child: TextHeading(title: "Home", fontweight: FontWeight.w600, fontsize: 16.sp, fontcolor: Colors.white),),
                  ),
                ),
                SizedBox(height: 10,)





             
                 
              
              
                ]         
              ),
            ),
          )
        ),
      )  
    );   
          
        
      
    
  }
}
