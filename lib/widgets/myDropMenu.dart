import 'package:flutter/material.dart';

class MyDropMenu extends StatelessWidget {
  const MyDropMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Admin', 'Staff'];
    String? selectedItem; // Add a variable to track the selected item

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(border: OutlineInputBorder()),
      hint: Text(items[0]),
      value: selectedItem, // Set the value to track the selected item
      items: items.map((e) {
        return DropdownMenuItem<String>(
          value: e, // Set the value for each item
          child: Text(e.toString()),
        );
      }).toList(),
      onChanged: (value) {
        
        // Update the selected item when an item is selected
        selectedItem = value;
      },
    );
  }
}
