import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/theme.dart';

class ShimmerCostume extends StatelessWidget {
  const ShimmerCostume({
    super.key,
    required this.height,
    this.width = double.infinity,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaulRadius),
          ),
        ),
      ),
    );
  }
}
