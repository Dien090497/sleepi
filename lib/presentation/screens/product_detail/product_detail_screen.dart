import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class ProductDetaiScreen extends StatelessWidget {
  const ProductDetaiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: SFText(keyText: 'Product Detail'),
          ),
        )
    );
  }
}
