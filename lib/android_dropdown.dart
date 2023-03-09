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
      elevation: 20,
      iconEnabledColor: Colors.white,
      iconSize: 24,
      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
      dropdownColor: Colors.black87,
      focusColor: Colors.white,
      iconDisabledColor: Colors.white,
      isDense: true,
      underline: SizedBox(
        height: 1.0,
        width: MediaQuery.of(context).size.width / 10,
      ),
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
            '$given ',
            style: kTextStyle,
          ),
        ),
      );
    }
    return result;
  }
}
