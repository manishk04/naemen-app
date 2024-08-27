import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/auth_view_model.dart';
import '../../view_models/google_map_view_model.dart';
import '../../view_models/language_view_model.dart';

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find();
    final GoogleMapViewModel googleMapViewModel = Get.find();
    LanguageViewModel languageViewModel = Get.find();
    authViewModel.onAppOpen(languageViewModel, googleMapViewModel);
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_image.jpeg',
        fit: BoxFit.fill, // Your logo asset
      ),
    );
  }
}

// class VideoSplashView extends StatefulWidget {
//   @override
//   _VideoSplashViewState createState() => _VideoSplashViewState();
// }

// class _VideoSplashViewState extends State<VideoSplashView> {
//   late VideoPlayerController _controller;
//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(
//         'assets/videos/WhatsApp Video 2024-08-26 at 2.21.16 PM.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//         _chewieController = ChewieController(
//           videoPlayerController: _controller,
//           autoPlay: true,
//           looping: false,
//         );
//       });

//     _controller.addListener(() {
//       if (_controller.value.position == _controller.value.duration) {
//         // Navigator.push(
//         //     context, MaterialPageRoute(builder: (context) => HomePage()));

//         // Navigator.of(context).pushReplacementNamed(
//         //     '/home'); // Navigate to the next screen when video ends
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AuthViewModel authViewModel = Get.find();
//     final GoogleMapViewModel googleMapViewModel = Get.find();
//     LanguageViewModel languageViewModel = Get.find();
//     authViewModel.onAppOpen(languageViewModel, googleMapViewModel);
//     return Scaffold(
//       body: _chewieController != null &&
//               _chewieController!.videoPlayerController.value.isInitialized
//           ? Chewie(controller: _chewieController!)
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }
