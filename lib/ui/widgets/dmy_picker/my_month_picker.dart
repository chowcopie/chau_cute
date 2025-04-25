import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart';

import 'dmy_picker_form.dart';
import 'dmy_picker_styles.dart';

class MyMonthPicker extends StatefulWidget {
  const MyMonthPicker({
    super.key,
    required this.initMonth,
    this.firstDate,
    this.lastDate,
  });

  final DateTime initMonth;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<MyMonthPicker> createState() => _MyMonthPickerState();
}

class _MyMonthPickerState extends State<MyMonthPicker> {
  DateTime _selectedDate = DateTime.now();

  _init() => _selectedDate = widget.initMonth;

  @override
  void didUpdateWidget(covariant MyMonthPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initMonth != widget.initMonth) {
      _init();
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return DMYPickerForm(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MonthPicker.single(
            selectedDate: _selectedDate,
            onChanged: (value) => setState(() => _selectedDate = value),
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
                onPressed: () => Navigator.of(context).pop(_selectedDate),
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
