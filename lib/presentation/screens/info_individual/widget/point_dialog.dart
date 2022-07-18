import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class PointDialog extends StatelessWidget {
  const PointDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        
      ],
    );
  }
}

class _IncreasePoint extends StatelessWidget {
  const _IncreasePoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
