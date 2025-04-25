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
      color: AppColors.mainColor,
      fontWeight: FontWeight.w600,
    ),
    nextIcon: const Icon(Icons.chevron_right, color: AppColors.mainColor),
    prevIcon: const Icon(Icons.chevron_left, color: AppColors.mainColor),
    selectedSingleDateDecoration: BoxDecoration(
      color: AppColors.mainColor,
      borderRadius: BorderRadius.circular(10),
    ),
    selectedPeriodStartDecoration: const BoxDecoration(
      color: AppColors.mainColor,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(10.0),
        bottomStart: Radius.circular(10.0),
      ),
    ),
    selectedPeriodLastDecoration: const BoxDecoration(
      color: AppColors.mainColor,
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(10),
        bottomEnd: Radius.circular(10),
      ),
    ),
    selectedPeriodMiddleDecoration: const BoxDecoration(
      color: AppColors.mainColor,
    ),
  );

  static ButtonStyle confirmBtnStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.mainColor,
  );

  static const TextStyle cancelTextStyle = TextStyle(
    color: AppColors.mainColor,
  );

  static final EventDecoration currentDayDecoration = EventDecoration(
    boxDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.mainColor),
    ),
    textStyle: const TextStyle(
      color: AppColors.mainColor,
      fontWeight: FontWeight.w600,
    ),
  );

  static final EventDecoration currentDayDisableDecoration = EventDecoration(
    boxDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.mainColor.withOpacity(0.3)),
    ),
    textStyle: datePickerStyle.disabledDateStyle,
  );
}
