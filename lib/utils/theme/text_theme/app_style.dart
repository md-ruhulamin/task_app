
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/constants/app_colors.dart';
import 'package:task_app/utils/theme/text_theme/app_text_size.dart';




abstract class AppStyle {
  static const textStyle12 = TextStyle(
      fontSize: AppTextSize.fontSizeSmall,
      color: AppColors.mDark,
      fontFamily: 'Inter'

  );
  static const hintStyle18 = TextStyle(
    fontSize: AppTextSize.fontSize18,
    color: AppColors.mDark,
      fontFamily: 'Inter'

  );
  static const textStyle18 = TextStyle(
    fontSize: AppTextSize.fontSize18,
    color: AppColors.mDark,
      fontFamily: 'Inter'

  );

  static const textStyle20 = TextStyle(
    fontSize: AppTextSize.fontSizeLarge,
    color: AppColors.mDark,
      fontFamily: 'Inter'

  );

  static const textStyle22 = TextStyle(
    fontSize: AppTextSize.fontSizeLarge2,
    color: AppColors.mDark,
      fontFamily: 'Inter'

  );

  static const textStyle16 = TextStyle(
    fontSize: AppTextSize.fontSize16,
    color: AppColors.mDark,
      fontFamily: 'Inter'

  );
  static const textStyle14 = TextStyle(
    fontSize: AppTextSize.fontSize14,
    color: AppColors.mDark,
    fontFamily: 'Inter'

  );
  static const textStyle15 = TextStyle(
    fontSize: AppTextSize.fontSize15,
    color: AppColors.mDark,
      fontFamily: 'Inter'

  );

  static const textHyperLinkStyle18 = TextStyle(
    fontSize: AppTextSize.fontSize18,
    color: AppColors.mDark,
    fontWeight: FontWeight.bold,
      fontFamily: 'Inter'

  );
  static const textHyperLinkStyle15 = TextStyle(
    fontSize: AppTextSize.fontSize15,
    color: AppColors.mDark,
    fontWeight: FontWeight.bold,
      fontFamily: 'Inter'

  );

  static const buttonStyle18 = TextStyle(
    fontSize: AppTextSize.fontSize18,
    color: AppColors.mDark,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,

  );
}
