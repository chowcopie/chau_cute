import 'package:demo_structure/core/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';

class DMYPickerStyle {
  static final datePickerStyle = DatePickerRangeStyles(
    dayHeaderTitleBuilder: (dayOfTheWeek, localizedWeekdayHeaders) {
      return "dayOfTheWeek";
    },
    firstDayOfWeekIndex: DateTime.monday,
    currentDateStyle: const TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
    ),
    nextIcon: const Icon(Icons.chevron_right, color: AppColors.primary),
    prevIcon: const Icon(Icons.chevron_left, color: AppColors.primary),
    selectedSingleDateDecoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(10),
    ),
    selectedPeriodStartDecoration: const BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(10.0),
        bottomStart: Radius.circular(10.0),
      ),
    ),
    selectedPeriodLastDecoration: const BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(10),
        bottomEnd: Radius.circular(10),
      ),
    ),
    selectedPeriodMiddleDecoration: const BoxDecoration(
      color: AppColors.primary,
    ),
  );

  static ButtonStyle confirmBtnStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
  );

  static const TextStyle cancelTextStyle = TextStyle(color: AppColors.primary);

  static final EventDecoration currentDayDecoration = EventDecoration(
    boxDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.primary),
    ),
    textStyle: const TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
    ),
  );

  static final EventDecoration currentDayDisableDecoration = EventDecoration(
    boxDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
    ),
    textStyle: datePickerStyle.disabledDateStyle,
  );
}
