import 'package:demo_structure/core/extensions/date_time_ext.dart';
import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart';

import 'dmy_picker_form.dart';
import 'dmy_picker_styles.dart';

class MyMultiDatePicker extends StatefulWidget {
  const MyMultiDatePicker({
    super.key,
    required this.initDates,
    this.firstDate,
    this.lastDate,
  });

  final List<DateTime> initDates;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<MyMultiDatePicker> createState() => _MyMultiDatePickerState();
}

class _MyMultiDatePickerState extends State<MyMultiDatePicker> {
  List<DateTime> _selectedDates = [];

  _init() => _selectedDates = widget.initDates;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant MyMultiDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initDates != widget.initDates) {
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
          DayPicker.multi(
            selectedDates: _selectedDates,
            onChanged: (value) => setState(() => _selectedDates = value),
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
                  _selectedDates.sort((a, b) => a.compareTo(b));
                  Navigator.of(context).pop(_selectedDates);
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
