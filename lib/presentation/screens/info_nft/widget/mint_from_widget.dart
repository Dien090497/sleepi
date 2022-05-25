import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class MintFromWidget extends StatelessWidget {
  const MintFromWidget({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SFText(
              keyText: text,
              style: TextStyles.bold15black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // MyBedShortWidget(
              //   index: 1,
              //   checkOwner: true,
              //   width: size.width * 0.35,
              //   height: 150,
              // ),
              // MyBedShortWidget(
              //   index: 1,
              //   checkOwner: true,
              //   width: size.width * 0.35,
              //   height: 150,
              // ),
            ],
          ),
        )
      ],
    );
  }
}
