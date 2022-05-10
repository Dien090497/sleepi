import 'package:flutter/material.dart';

class SFGridView extends StatelessWidget {
  const SFGridView({required this.itemBuilder, required this.count, Key? key})
      : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int count;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
      padding: const EdgeInsets.all(12),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: itemBuilder,
    );
  }
}
