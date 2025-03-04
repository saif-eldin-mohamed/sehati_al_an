import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GallerySection extends StatelessWidget {
  final List<String> imageUrls;

  const GallerySection({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GalleryImage(imageUrl: imageUrls[index]),
          );
        },
      ),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String imageUrl;

  const GalleryImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
