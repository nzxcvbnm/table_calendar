// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/src/widgets/dropdown_button.dart';

import '../shared/utils.dart' show CalendarFormat;

class FormatButton extends StatelessWidget {
  final CalendarFormat calendarFormat;
  final ValueChanged<CalendarFormat> onTap;
  final TextStyle textStyle;
  final BoxDecoration decoration;
  final EdgeInsets padding;
  final bool showsNextFormat;
  final Map<CalendarFormat, String> availableCalendarFormats;

  const FormatButton({
    Key? key,
    required this.calendarFormat,
    required this.onTap,
    required this.textStyle,
    required this.decoration,
    required this.padding,
    required this.showsNextFormat,
    required this.availableCalendarFormats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = availableCalendarFormats.values
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
              ),
            ))
        .toList();

    return StyledDropDownButton(
        selectedValue: availableCalendarFormats[calendarFormat]!,
        items: items,
        onChanged: (item) => onTap(select(item)));

    return ElevatedButton(
        onPressed: () => onTap(_nextFormat()), child: Text(_formatButtonText));
  }

  String get _formatButtonText => showsNextFormat
      ? availableCalendarFormats[_nextFormat()]!
      : availableCalendarFormats[calendarFormat]!;

  CalendarFormat _nextFormat() {
    final formats = availableCalendarFormats.keys.toList();
    int id = formats.indexOf(calendarFormat);
    id = (id + 1) % formats.length;
    return formats[id];
  }

  CalendarFormat select(String? format) {
    debugPrint(format);

    final List<String> list = availableCalendarFormats.values.toList();
    int index = list.indexOf(format!);
    final CalendarFormat calendarFormat =
        availableCalendarFormats.keys.toList()[index];

    return calendarFormat;
  }
}
