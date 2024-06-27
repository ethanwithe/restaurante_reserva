// En lib/widgets/custom_dropdown.dart

import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final Function(String)? onChanged;

  CustomDropdown({required this.items, this.onChanged});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedItem,
      onChanged: (value) {
        setState(() {
          _selectedItem = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value!);
        }
      },
      items: widget.items.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}
