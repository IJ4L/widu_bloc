import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CostumeButton extends StatelessWidget {
  const CostumeButton({
    super.key,
    this.color = kWhiteColor,
    required this.title,
    this.colorTitle = kPrimaryColor,
    this.height = 60,
    this.width = 239,
    this.radius = 20,
    this.blurRadius = 5,
    this.spreadRadius = 1,
    this.offset = const Offset(1, 3),
    this.opacity = 0.3,
    this.widthBorder = 0,
    this.fontWeight = FontWeight.w400,
    required this.ontap,
  });

  final Color color, colorTitle;
  final String title;
  final double height, width, radius, opacity;
  final double blurRadius, spreadRadius, widthBorder;
  final Offset offset;
  final FontWeight fontWeight;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: kWhiteColor, width: widthBorder),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(opacity),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: offset,
            blurStyle: BlurStyle.solid,
          ),
        ],
      ),
      child: TextButton(
        onPressed: ontap,
        style: TextButton.styleFrom(
          backgroundColor: color,
          elevation: 10,
          shadowColor: kBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          title,
          style: purpleTextStyle.copyWith(
            fontSize: 16,
            fontWeight: fontWeight,
            color: colorTitle,
          ),
          textScaleFactor: 1,
        ),
      ),
    );
  }
}
