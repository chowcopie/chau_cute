import 'package:demo_structure/core/extensions/date_time_ext.dart';
import 'package:demo_structure/core/themes/color.dart';
import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart';

import 'dmy_picker_form.dart';
import 'dmy_picker_styles.dart';

class MyMonthRangePicker extends StatefulWidget {
  const MyMonthRangePicker({
    super.key,
    required this.initMonth,
    this.showTextRange = false,
    this.firstMonth,
    this.lastMonth,
  });

  final DateTime initMonth;
  final bool showTextRange;
  final DateTime? firstMonth;
  final DateTime? lastMonth;

  @override
  State<MyMonthRangePicker> createState() => _MyMonthRangePickerState();
}

class _MyMonthRangePickerState extends State<MyMonthRangePicker> {
  DateTime? _begin;
  DateTime? _end;
  final List<DateTime> _selectedMonths = [];

  _init() {
    _selectedMonths.clear();
    _begin = widget.initMonth;
    _end = null;
    _selectedMonths.add(widget.initMonth);
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant MyMonthRangePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initMonth != widget.initMonth) {
      _init();
    }
  }

  _reComputeSelectedMonths() {
    _selectedMonths.clear();
    if (_begin == null) {
      _end = null;
    } else {
      if (_end == null) {
        _selectedMonths.add(_begin!);
      } else {
        if (_end!.isBefore(_begin!)) {
          var temp = _begin!.copyWith();
          _begin = _end;
          _end = temp;
        }

        final end = _end!.toStartOfMonth();
        final begin = _begin!.toStartOfMonth();
        for (var i = begin; i.compareTo(end) < 1; i = i.toNextMonth()) {
          _selectedMonths.add(i);
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DMYPickerForm(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              MonthPicker.multi(
                selectedDates: _selectedMonths,
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }

                  if (_begin == null) {
                    _begin = value.first;
                    _end = null;
                  } else if (_end == null) {
                    _end = value.last;
                  } else {
                    _begin = value.last;
                    _end = null;

                    if (_selectedMonths.contains(_begin!)) {
                      _begin = null;
                    }
                  }

                  _reComputeSelectedMonths();
                },
                firstDate: widget.firstMonth ?? DateTime(2010),
                lastDate: widget.lastMonth ?? DateTime(2030),
                datePickerStyles: DMYPickerStyle.datePickerStyle,
                datePickerLayoutSettings: DatePickerLayoutSettings(
                  maxDayPickerRowCount: widget.showTextRange ? 5 : 6,
                ),
              ),
              if (widget.showTextRange) ...[
                Text(
                  getText(),
                  style: const TextStyle(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ],
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
                  Navigator.of(context).pop(
                    DatePeriod(_selectedMonths.first, _selectedMonths.last),
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

  String getText() {
    String beginStr = _begin != null ? _begin!.toMYFormat() : '_/_';

    if (_end == null && _begin != null) {
      return '$beginStr - $beginStr';
    }

    String endStr = _end != null ? _end!.toMYFormat() : '_/_';

    return '$beginStr - $endStr';
  }
}
