import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class StyledDropDownButton extends StatelessWidget {
  const StyledDropDownButton(
      {required this.selectedValue,
      required this.items,
      required this.onChanged});
  final List<DropdownMenuItem<String>> items;
  final String selectedValue;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      items: items,
      value: selectedValue,
      buttonStyleData: selectedItemStyle,
      dropdownStyleData: itemsStyle,
      onChanged: onChanged.call,
      iconStyleData: const IconStyleData(iconEnabledColor: Colors.transparent),
      underline: Container(),
    );
  }
}

ButtonStyleData selectedItemStyle = ButtonStyleData(
  width: 120,
  padding: const EdgeInsets.only(left: 14, right: 14),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: Colors.deepPurple.withOpacity(0.12)),
);

DropdownStyleData itemsStyle = DropdownStyleData(
  elevation: 0,
  width: 120,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    color: Colors.deepPurple.withOpacity(0.12),
  ),
);
