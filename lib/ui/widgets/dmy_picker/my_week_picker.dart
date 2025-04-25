import 'package:demo_structure/core/extensions/date_time_ext.dart';
import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart';

import 'dmy_picker_form.dart';
import 'dmy_picker_styles.dart';

class MyWeekPicker extends StatefulWidget {
  const MyWeekPicker({
    super.key,
    required this.initWeek,
    this.firstDate,
    this.lastDate,
  });

  final DateTime initWeek;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<MyWeekPicker> createState() => _MyWeekPickerState();
}

class _MyWeekPickerState extends State<MyWeekPicker> {
  DatePeriod _datePeriod = DatePeriod(
    DateTime.now().toStartOfWeek(),
    DateTime.now().toEndOfWeek(),
  );

  _init() {
    _datePeriod = DatePeriod(
      widget.initWeek.toStartOfWeek(),
      widget.initWeek.toEndOfWeek(),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant MyWeekPicker oldWidget) {
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
          WeekPicker(
            selectedDate: _datePeriod.start,
            onChanged: (value) => setState(() => _datePeriod = value),
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
                onPressed: () {
                  Navigator.of(context).pop(_datePeriod..end.toEndOfDate());
                },
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
