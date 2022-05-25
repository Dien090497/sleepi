import 'package:flutter/material.dart';

class SFGridView extends StatelessWidget {
  const SFGridView(
      {required this.itemBuilder,
      required this.count,
      Key? key,
      this.childAspectRatio = 9 / 10})
      : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int count;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
      padding: const EdgeInsets.all(12),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
