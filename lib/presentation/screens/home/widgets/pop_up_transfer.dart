import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpTransfer extends StatelessWidget {
  const PopUpTransfer({
    Key? key,
    required this.onConfirm,
    this.onCancel,
    required this.fee,
    required this.valueTransfer,
  }) : super(key: key);

  final int fee;
  final int valueTransfer;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        Column(
          children: [
            SFText(
              keyText: LocaleKeys.confirmTransfer,
              style: TextStyles.white1w700size16,
            ),
            const SizedBox(height: 20),
            SFCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      SFText(
                        keyText: LocaleKeys.from,
                        style: TextStyles.lightGrey12,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: SFText(
                          keyText: LocaleKeys.to,
                          style: TextStyles.lightGrey12,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SFText(
                        keyText: LocaleKeys.inventory,
                        style: TextStyles.bold16LightWhite,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: SFText(
                          keyText: LocaleKeys.wallet,
                          style: TextStyles.bold16LightWhite,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                SFText(
                  keyText: LocaleKeys.fee,
                  style: TextStyles.lightGrey12,
                ),
                const SizedBox(width: 4),
                Expanded(
                    child: SFText(
                  keyText: '$fee SLFT',
                  textAlign: TextAlign.right,
                  style: TextStyles.white12,
                )),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SFText(
                  keyText: LocaleKeys.youWillTransfer,
                  style: TextStyles.lightGrey12,
                ),
                const SizedBox(width: 4),
                Expanded(
                    child: SFText(
                  keyText: '$valueTransfer NFT',
                  textAlign: TextAlign.right,
                  style: TextStyles.white12,
                )),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.cancel,
                    onPressed: onCancel,
                    textStyle: TextStyles.lightGrey16,
                    color: AppColors.light4,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.confirm,
                    onPressed: () {
                      onConfirm();
                      Navigator.pop(context);
                      showSuccessfulDialog(context);
                    },
                    textStyle: TextStyles.white16,
                    gradient: AppColors.gradientBlueButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
