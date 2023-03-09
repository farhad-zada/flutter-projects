import 'package:flutter/cupertino.dart';

class IOSPicker extends StatelessWidget {
  final String? selected;
  final List<String> dropdownMenuData;
  final Function(int) toDo;
  const IOSPicker({
    super.key,
    required this.selected,
    required this.dropdownMenuData,
    required this.toDo,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 35.4,
      onSelectedItemChanged: toDo,
      children: getCurrencyList(),
    );
  }

  List<Text> getCurrencyList() {
    List<Text> result = [];
    for (String currency in dropdownMenuData) {
      result.add(Text(currency));
    }
    return result;
  }
}
