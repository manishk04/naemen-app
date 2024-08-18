import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/views/screens/booking_detail_page.dart';

import '../components/text_heading.dart';

class ExpansionTileControllerApp extends StatefulWidget {
  const ExpansionTileControllerApp({super.key});

  @override
  State<ExpansionTileControllerApp> createState() =>
      _ExpansionTileControllerAppState();
}

class _ExpansionTileControllerAppState
    extends State<ExpansionTileControllerApp> {
  final ExpansionTileController controller = ExpansionTileController();
  bool _isLoading = false;

  Future<void> _checkArtistAvailability() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a network request or delay
    await Future.delayed(Duration(seconds: 5));

    setState(() {
      _isLoading = false;
    });

    // Example: Check if the artist is available
    bool isArtistAvailable = _isArtistAvailable();

    // Show the popup
    _showAvailabilityPopup(isArtistAvailable);
  }

  bool _isArtistAvailable() {
    // Logic to determine if the artist is available
    // This is just an example, you would replace this with your actual logic
    return DateTime.now().second % 2 == 0; // Just a random condition
  }

  void _showAvailabilityPopup(bool isAvailable) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isAvailable ? 'Artist Available' : 'Artist Unavailable'),
          content: Text(isAvailable
              ? 'The artist is available for the appointment.'
              : 'The artist is not available at the moment.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookingDetailPage()));
              },
              child: Container(
                height: 23.h,
                width: 55.w,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(4.r)),
                child: Center(
                  child: TextHeading(
                      title: "Okey",
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontcolor: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          controller: controller,
          title: Text(
            "Option 1",
            style: TextStyle(color: Colors.white),
          ),
          children: [
            Container(
              height: 60.h,
              width: 340.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextHeading(
                      title: "1 Service added",
                      fontweight: FontWeight.w600,
                      fontsize: 14.sp,
                      fontcolor: Colors.white),
                  InkWell(
                    onTap: () {
                      _checkArtistAvailability();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointmentScreen()));
                    },
                    child: _isLoading
                        ? CircularProgressIndicator(
                            color: Colors.orange,
                          )
                        : Container(
                            height: 32.h,
                            width: 148.w,
                            decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextHeading(
                                    title: "Book appointment",
                                    fontweight: FontWeight.w600,
                                    fontsize: 12.sp,
                                    fontcolor: Colors.white),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                Container(
                  height: 123.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/masseag.png",
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading(
                                title: "Body Massage",
                                fontweight: FontWeight.w400,
                                fontsize: 16.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextHeading(
                                title: "51",
                                fontweight: FontWeight.w600,
                                fontsize: 18.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              height: 5.h,
                            ),
                            // TextHeading(title: "Lorem Ipsum is simply dummy text of the\n printing and more", fontweight: FontWeight.w400, fontsize: 8.sp, fontcolor: Colors.white)
                          ],
                        ),
                        //  Icon(Icons.menu,color: Colors.white,size: 12,)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 5,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      radius: 15,
                      backgroundColor: Colors.yellow.withOpacity(0.6),
                    ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                Container(
                  height: 123.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/beard_cut_img.jpeg"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading(
                                title: "Beard Cut",
                                fontweight: FontWeight.w400,
                                fontsize: 16.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextHeading(
                                title: "50",
                                fontweight: FontWeight.w600,
                                fontsize: 20.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              height: 5.h,
                            ),
                            //  TextHeading(title: "Lorem Ipsum is simply dummy text of the\n printing and more", fontweight: FontWeight.w400, fontsize: 8.sp, fontcolor: Colors.white)
                          ],
                        ),
                        // Icon(Icons.menu,color: Colors.white,size: 12,)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 5,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      radius: 15,
                      backgroundColor: Colors.yellow.withOpacity(0.6),
                    ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                Container(
                  height: 123.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/hair_men cut.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        // Image.asset("assets/images/hair_men cut.jpg",width: 90,),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading(
                                title: "Hair Cut",
                                fontweight: FontWeight.w400,
                                fontsize: 16.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextHeading(
                                title: "55",
                                fontweight: FontWeight.w600,
                                fontsize: 20.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              height: 5.h,
                            ),
                            //   TextHeading(title: "Lorem Ipsum is simply dummy text of the\n printing and more", fontweight: FontWeight.w400, fontsize: 8.sp, fontcolor: Colors.white)
                          ],
                        ),
                        // Icon(Icons.menu,color: Colors.white,size: 12,)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 5,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      radius: 15,
                      backgroundColor: Colors.yellow.withOpacity(0.6),
                    ))
              ],
            )
          ],
        ),
      ],
    );
  }
}
