import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/ui/util/replace_tag.dart';

import '../../bloc/choice_bloc.dart';
import '../../shared/theme.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    super.key,
    required this.alphabet,
    required this.answer,
    required this.color,
    required this.event,
    required this.imgAnswer,
  });

  final String alphabet, answer;
  final dynamic imgAnswer;
  final bool color;
  final ChoiceEvent event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ChoiceBloc>().add(event);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: color ? kSecondColor : kWhiteColor,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            width: 1.0,
            color: Colors.grey[900]!,
          ),
        ),
        child: Row(
          children: [
            Text(
              alphabet,
              style: blackTextStyle.copyWith(fontSize: 11.sp),
            ),
            SizedBox(width: 16.w),
            imgAnswer == null
                ? Expanded(
                    child: Text(
                      replaceTags(answer),
                      style: blackTextStyle.copyWith(fontSize: 11.sp),
                      maxLines: answer.length > 100 ? 2 : 1,
                    ),
                  )
                : Image.network(
                    imgAnswer,
                    width: 200.w,
                    fit: BoxFit.fill,
                  ),
          ],
        ),
      ),
    );
  }
}
