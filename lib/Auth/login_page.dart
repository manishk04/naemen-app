import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Auth/otp_page.dart';
import 'package:naemen/Auth/sign_up_screen.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/utils/color_constant.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/sign up bg2.jpg"),fit: BoxFit.cover))
          ),


          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                          SizedBox(height: 90.h,),
                 //Image.asset("assets/images/Namen Logo (1).png",height: 136,width: 1360,),
                          SizedBox(height: 12.h,),
                           TextHeading(title: "Sign in now", fontweight: FontWeight.w700, fontsize: 26.sp, fontcolor: AppColors.primarycolor),
                           SizedBox(height: 10.h,),
                          TextHeading(title: "Please sign in to continue our app", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: AppColors.SignupColor),
                          SizedBox(height: 80.h,),
                          Form(
                                key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: _phoneController,
                                
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                  hintText: "Enter mobile number",hintStyle: TextStyle(color: AppColors.SignupColor,fontWeight: FontWeight.w400),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                     borderSide: const BorderSide(color: AppColors.primarycolor, width: 1.0),
                                  ),//filled: true,
                                        fillColor: Colors.black.withOpacity(0.8),),
                                       
                                         keyboardType: TextInputType.phone,
                                          // obscureText: ,
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
                                        SizedBox(height: 20.h,),
                                        TextFormField(
                                          style: TextStyle(color: Colors.white),
                                          controller: _passwordController,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(8),
                          hintText: 'Password',hintStyle: TextStyle(color: AppColors.SignupColor,fontWeight: FontWeight.w300) ,
                          suffixIcon: IconButton(onPressed: _togglePasswordVisibility, icon: Icon(_obscureText?Icons.visibility_off:Icons.visibility)),

                        focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                     borderSide: const BorderSide(color: AppColors.primarycolor, width: 1.0),
                                  ),
                         // filled: true,
                          fillColor: Colors.black.withOpacity(0.8),

                           
                        ),
                         obscureText: _obscureText,
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                                        )
                
                              ],
                            ),
                
                
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage()));
                                },
                                  child: TextHeading(title: "Login by OTP", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: AppColors.primarycolor))
                              
                            ],
                          ),
                          SizedBox(height: 85.h,),
                          InkWell(
                            onTap: (){
                                if (_formKey.currentState!.validate()) {
                          // Process data
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text('Processing Data')),
                          // );
                        }
                            },
                            child: Container(
                              height: 40.h,
                              width: 340.w,
                              decoration: BoxDecoration(
                                color: AppColors.primarycolor,
                                borderRadius: BorderRadius.circular(8.r)),
                                child: Center(
                                  child: TextHeading(title: "Sign in", fontweight: FontWeight.w600, fontsize: 16.sp, fontcolor: Colors.white),
                                ),
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextHeading(title: "Don’t have an account?", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: AppColors.SignupColor),
                              SizedBox(width: 3.w,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                                },
                                child: TextHeading(title: "Sign up", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: AppColors.primarycolor))
                            ],
                          )
                
                
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