import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Auth/Verify_phone.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/utils/color_constant.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/sign up bg2.jpg"),
                      fit: BoxFit.cover))),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Image.asset(
                      "assets/images/Namen Logo (1).png",
                      height: 136,
                      width: 1360,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextHeading(
                        title: "OTP Verification",
                        fontweight: FontWeight.w700,
                        fontsize: 26.sp,
                        fontcolor: AppColors.primarycolor),
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            TextHeading(
                                title: "By signup, you’re agree to our",
                                fontweight: FontWeight.w500,
                                fontsize: 10.sp,
                                fontcolor: AppColors.SignupColor),
                            TextHeading(
                                title: "Terms & Condition",
                                fontweight: FontWeight.w600,
                                fontsize: 12.sp,
                                fontcolor: AppColors.primarycolor),
                            // Row(
                            //   children: [
                            //     TextHeading(
                            //         title: "and",
                            //         fontweight: FontWeight.w500,
                            //         fontsize: 10.sp,
                            //         fontcolor: Colors.white),
                            //     TextHeading(
                            //         title: "Privacy Policy",
                            //         fontweight: FontWeight.w600,
                            //         fontsize: 10.sp,
                            //         fontcolor: AppColors.primarycolor)
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _phoneController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Enter phone number",
                          hintStyle: TextStyle(color: AppColors.SignupColor),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.8),
                        ),
                        keyboardType: TextInputType.phone,
                        //obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VerifyPhone()));
                          // Process data
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('OTP Sent')),
                          );
                        }
                      },
                      child: Container(
                        height: 40.h,
                        width: 340.w,
                        decoration: BoxDecoration(
                            color: AppColors.primarycolor,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Center(
                          child: TextHeading(
                              title: "Submit",
                              fontweight: FontWeight.w600,
                              fontsize: 16.sp,
                              fontcolor: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
