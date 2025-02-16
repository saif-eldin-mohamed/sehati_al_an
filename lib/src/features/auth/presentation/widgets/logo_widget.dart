import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resourses/theming/images.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.useDefaultSize = true,
  });

  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment alignment;
  final bool useDefaultSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: useDefaultSize ? 150.w : (width ?? 150.w),
          maxHeight: useDefaultSize ? 100.h : (height ?? 100.h),
        ),
        child: Image.asset(
          ImagesManager.logoImg,
          fit: fit,
          alignment: alignment,
          filterQuality: FilterQuality.high,
          isAntiAlias: true,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              child: child,
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
