import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../view_models/auth_view_model.dart';
import '../../view_models/google_map_view_model.dart';
import '../../view_models/language_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late VideoPlayerController _controller;

  final AuthViewModel _authViewModel = Get.find();
  final LanguageViewModel _languageViewModel = Get.find();
  final GoogleMapViewModel _googleMapViewModel = Get.find();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/splash_video.mp4');

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration &&
          !_controller.value.isPlaying) {
        setState(() {});
        _authViewModel.onAppOpen(_languageViewModel, _googleMapViewModel);
      }
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayer(_controller),
    );
  }
}
