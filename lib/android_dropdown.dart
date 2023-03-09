import 'package:crypto/coin_data.dart';
import 'package:flutter/material.dart';

class AndroidPicker extends StatelessWidget {
  final String? selected;
  final List<String> dropdownMenuData;
  final void Function(String? value) toDo;

  const AndroidPicker({
    super.key,
    required this.selected,
    required this.dropdownMenuData,
    required this.toDo,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.black87,
      focusColor: Colors.white,
      iconDisabledColor: Colors.white,
      value: selected,
      items: getDropDownMenuData(),
      onChanged: toDo,
    );
  }

  List<DropdownMenuItem<String>> getDropDownMenuData() {
    List<DropdownMenuItem<String>> result = [];
    for (String given in dropdownMenuData) {
      result.add(
        DropdownMenuItem(
          value: given,
          child: Text(
            given,
            style: kTextStyle,
          ),
        ),
      );
    }
    return result;
  }
}
