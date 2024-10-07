import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

class YesNoSelection extends StatefulWidget {
  const YesNoSelection({
    super.key,
    required this.onSelection,
  });

  final void Function(int numberOfAttendees) onSelection;

  @override
  _YesNoSelectionState createState() => _YesNoSelectionState();
}

class _YesNoSelectionState extends State<YesNoSelection> {
  int _attendeesCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'How many attending:',
          ),
          InputQty(
            initVal: _attendeesCount,
            minVal: 0,
            maxVal: 100,
            onQtyChanged: (value) {
                setState(() {
                  _attendeesCount = value.round();
                });
              }
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              widget.onSelection(_attendeesCount);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
