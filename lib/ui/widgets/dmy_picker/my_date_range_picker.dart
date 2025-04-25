import 'package:demo_structure/core/extensions/date_time_ext.dart';
import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart';

import 'dmy_picker_form.dart';
import 'dmy_picker_styles.dart';

class MyDateRangePicker extends StatefulWidget {
  const MyDateRangePicker({
    super.key,
    required this.startTime,
    required this.endTime,
    this.firstDate,
    this.lastDate,
    this.crossMonth = true,
  }) : assert(
         crossMonth || (firstDate != null && lastDate != null),
         'firstDate and lastDate must not be null when crossMonth is false',
       );
  final DateTime startTime;
  final DateTime endTime;
  final DateTime? firstDate;
  final DateTime? lastDate;

  final bool crossMonth;

  @override
  State<MyDateRangePicker> createState() => _MyDateRangePickerState();
}

class _MyDateRangePickerState extends State<MyDateRangePicker> {
  DatePeriod _datePeriod = DatePeriod(
    DateTime.now().toStartOfWeek(),
    DateTime.now().toEndOfWeek(),
  );

  _init() {
    _datePeriod = DatePeriod(widget.startTime, widget.endTime);
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant MyDateRangePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startTime != widget.startTime ||
        oldWidget.endTime != widget.endTime) {
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
            onMonthChanged: (value) {
              if (widget.crossMonth) return;

              if (value.isAfter(widget.firstDate!)) {
                setState(() {
                  _datePeriod = DatePeriod(value, value);
                });
              } else {
                setState(() {
                  _datePeriod = DatePeriod(
                    widget.firstDate!,
                    widget.firstDate!,
                  );
                });
              }
            },
            onChanged: (value) => setState(() => _datePeriod = value),
            firstDate: widget.firstDate ?? DateTime(2010),
            lastDate: widget.lastDate ?? DateTime(2030),
            datePickerStyles: DMYPickerStyle.datePickerStyle,
            eventDecorationBuilder: (date) {
              final now = DateTime.now();
              if (now.sameDay(date)) {
                if (widget.firstDate != null && widget.lastDate != null) {
                  if (!now.isBetweenDay(widget.firstDate!, widget.lastDate!)) {
                    return DMYPickerStyle.currentDayDisableDecoration;
                  }
                }
                return DMYPickerStyle.currentDayDecoration;
              }

              return null;
            },
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
