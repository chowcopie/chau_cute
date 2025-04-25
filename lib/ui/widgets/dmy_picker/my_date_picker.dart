import 'package:demo_structure/core/extensions/date_time_ext.dart';
import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart';

import 'dmy_picker_form.dart';
import 'dmy_picker_styles.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({
    super.key,
    required this.initTime,
    this.firstDate,
    this.lastDate,
  });

  final DateTime initTime;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  late DateTime _selectedDate;
  late DateTime _firstDate;
  late DateTime _lastDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initTime;
    _firstDate = widget.firstDate ?? DateTime(2010);
    _lastDate = widget.lastDate ?? DateTime(2030);

    _clampSelectedDate();
  }

  void _clampSelectedDate() {
    if (_selectedDate.isBefore(_firstDate)) {
      _selectedDate = _firstDate;
    }
    if (_selectedDate.isAfter(_lastDate)) {
      _selectedDate = _lastDate;
    }
  }

  @override
  void didUpdateWidget(covariant MyDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.firstDate != widget.firstDate) {
      _firstDate = widget.firstDate ?? DateTime(2010);
    }

    if (oldWidget.lastDate != widget.lastDate) {
      _lastDate = widget.lastDate ?? DateTime(2030);
    }

    if (oldWidget.initTime != widget.initTime) {
      _selectedDate = widget.initTime;
    }

    _clampSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    return DMYPickerForm(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DayPicker.single(
            selectedDate: _selectedDate,
            onChanged: (value) => setState(() => _selectedDate = value),
            firstDate: _firstDate,
            lastDate: _lastDate,
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
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
                  Navigator.of(context).pop(
                    DatePeriod(
                      _selectedDate.toStartOfDate(),
                      _selectedDate.toEndOfDate(),
                    ),
                  );
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
