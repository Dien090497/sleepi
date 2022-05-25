import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';

class SFLabelValue extends StatelessWidget {
  const SFLabelValue({
    Key? key,
    required this.label,
    this.styleLabel = TextStyles.labelStyle,
    this.icon,
    required this.value,
    this.styleValue = TextStyles.labelStyle,
  }) : super(key: key);

  final String label;
  final TextStyle? styleLabel;
  final String? icon;
  final String value;
  final TextStyle? styleValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Text(
              label,
              style: styleLabel,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  if (icon != null) SFIcon(icon!),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    value,
                    style: styleValue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
