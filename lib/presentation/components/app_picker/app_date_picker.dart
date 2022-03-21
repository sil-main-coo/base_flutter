import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_picker.dart';

class AppDatePickerConstants {
  static final now = DateTime.now();

  static final maximumDate = DateTime(2100, 01, 01);
  static final maximumYear = maximumDate.year;

  static final minimumDate = DateTime(1900, 01, 01);
  static final minimumYear = minimumDate.year;
}

class AppDatePicker {
  static void show(
      {required BuildContext context,
      required DateTime initialDateTime,
      Function(DateTime)? onPressedDone,
      Function(DateTime)? onDateTimeChanged,
      required DateTime maximumDate,
      required int maximumYear,
      required DateTime minimumDate,
      required int minimumYear,
      CupertinoDatePickerMode? mode}) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (ct) {
          return _AppDatePickerWidget(
            initialDateTime: initialDateTime,
            minimumDate: AppDatePickerConstants.minimumDate,
            maximumDate: AppDatePickerConstants.now,
            maximumYear: AppDatePickerConstants.now.year,
            minimumYear: AppDatePickerConstants.minimumYear,
            onPressedDone: onPressedDone,
          );
        });
  }
}

// ignore: must_be_immutable
class _AppDatePickerWidget extends StatelessWidget {
  final DateTime initialDateTime;
  final DateTime maximumDate;
  final int minimumYear;
  final DateTime minimumDate;
  final int maximumYear;
  final CupertinoDatePickerMode? mode;
  final Function(DateTime)? onPressedDone;
  final Function(DateTime)? onDateTimeChanged;

  _AppDatePickerWidget(
      {required this.initialDateTime,
      this.onPressedDone,
      this.onDateTimeChanged,
      required this.maximumDate,
      required this.maximumYear,
      required this.minimumDate,
      required this.minimumYear,
      this.mode});

  late DateTime _dateTimeSelected;

  @override
  Widget build(BuildContext context) {
    _dateTimeSelected = initialDateTime;
    return AppPicker(
      onPressedDone: () {
        onPressedDone!(_dateTimeSelected);
      },
      child: CupertinoDatePicker(
        backgroundColor: Colors.white,
        initialDateTime: initialDateTime,
        onDateTimeChanged: (value) {
          _dateTimeSelected = value;
          if (onDateTimeChanged != null) {
            onDateTimeChanged!(value);
          }
        },
        maximumDate: maximumDate,
        minimumYear: minimumYear,
        minimumDate: minimumDate,
        maximumYear: maximumYear,
        mode: mode ?? CupertinoDatePickerMode.date,
      ),
    );
  }
}
