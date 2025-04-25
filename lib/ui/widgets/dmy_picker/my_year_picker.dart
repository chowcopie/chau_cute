import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart' as picker;

import 'dmy_picker_form.dart';
import 'dmy_picker_styles.dart';

class MyYearPicker extends StatefulWidget {
  const MyYearPicker({
    super.key,
    required this.initYear,
    this.firstDate,
    this.lastDate,
  });

  final DateTime initYear;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<MyYearPicker> createState() => _MyYearPickerState();
}

class _MyYearPickerState extends State<MyYearPicker> {
  DateTime _selectedDate = DateTime.now();

  _init() => _selectedDate = widget.initYear;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant MyYearPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initYear != widget.initYear) {
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
          picker.YearPicker.single(
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
