import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8).r,
              )
          ),
          child:  Text("Next",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),)
      ),
    );
  }
}
