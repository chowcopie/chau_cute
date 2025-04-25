import 'package:demo_structure/core/extensions/date_time_ext.dart';
import 'package:demo_structure/core/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart';

import 'dmy_picker_form.dart';
import 'dmy_picker_styles.dart';

class MySpecificWeekPicker extends StatefulWidget {
  const MySpecificWeekPicker({
    super.key,
    required this.initWeek,
    this.firstDate,
    this.lastDate,
  });

  final DateTime initWeek;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<MySpecificWeekPicker> createState() => _MySpecificWeekPickerState();
}

class _MySpecificWeekPickerState extends State<MySpecificWeekPicker> {
  late DatePeriod _datePeriod;

  /// Điều chỉnh lại tuần sao cho tuần luôn nằm trong tháng
  /// Không có tuần bị nằm giữa 2 tháng
  _assignWeek(DatePeriod period) {
    final month = period.start;

    DateTime startWeek = DateTimeUtils.max(
      month.toStartOfMonth(),
      period.start.toStartOfWeek(),
    );
    DateTime endWeek = DateTimeUtils.min(
      month.toEndOfMonth(),
      period.end.toEndOfWeek(),
    );

    _datePeriod = DatePeriod(startWeek, endWeek);
  }

  _init() {
    _assignWeek(DatePeriod(widget.initWeek, widget.initWeek.toEndOfWeek()));
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant MySpecificWeekPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initWeek != widget.initWeek) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DMYPickerForm(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RangePicker(
            selectedPeriod: _datePeriod,
            onChanged: (value) => setState(() => _assignWeek(value)),
            firstDate: widget.firstDate ?? DateTime(2010),
            lastDate: widget.lastDate ?? DateTime(2030),
            datePickerStyles: DMYPickerStyle.datePickerStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  "dmyPicker.cancel",
                  style: DMYPickerStyle.cancelTextStyle,
                ),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(_datePeriod),
                style: DMYPickerStyle.confirmBtnStyle,
                child: const Text("dmyPicker.confirm"),
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
