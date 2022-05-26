import 'package:flutter/material.dart';

class SFGridView extends StatelessWidget {
  const SFGridView(
      {required this.itemBuilder,
      required this.count,
      Key? key,
      this.childAspectRatio = 9 / 10,
      this.isScroll=true})
      : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int count;
  final double childAspectRatio;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
      shrinkWrap: true,
      physics: isScroll ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
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
