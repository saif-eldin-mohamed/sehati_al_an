import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resourses/theming/images.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesManager.videoCallImg),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
