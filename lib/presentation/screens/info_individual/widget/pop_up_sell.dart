import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class PopUpSell extends StatefulWidget {
  const PopUpSell({
    Key? key,
    required this.icon,
    required this.cost,
    required this.level,
    required this.time,
    required this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  final String icon;
  final int cost;
  final int level;
  final int time;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  @override
  State<PopUpSell> createState() => _PopUpSellState();
}

class _PopUpSellState extends State<PopUpSell> {
  int step = 0;

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: (){
                widget.onCancel!();
                Navigator.pop(context);
              },
              child: const Icon(Icons.close, color: AppColors.lightGrey),
            ),
          ),
          Column(
            children: [
              SFText(
                  keyText: step == 2 ? LocaleKeys.confirm_to_sell : LocaleKeys.sell,
                  style: TextStyles.white1w700size18),
              const SizedBox(height: 20),
              if (step < 2) SFIcon(widget.icon),
              if (step < 2) const SizedBox(height: 24),
              if (step < 2)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: SFText(keyText: 'IDIDIDID', style: TextStyles.blue14),
                ),
              if (step < 2) const SizedBox(height: 32),
              if (step == 0)
                const _Detail()
              else if (step == 1) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: SFText(
                    keyText: LocaleKeys.selling_price,
                    style: TextStyles.lightGrey14,
                  ),
                ),
                const SizedBox(height: 4),
                const _InputPrice(),
              ] else
                const _Confirm(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SFButton(
                      text: LocaleKeys.cancel,
                      onPressed: () {
                        widget.onCancel!();
                        Navigator.pop(context);
                      },
                      textStyle: TextStyles.lightGrey16,
                      color: AppColors.light4,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SFButton(
                      text: step < 2 ? LocaleKeys.next : LocaleKeys.confirm,
                      textStyle: TextStyles.white16,
                      width: double.infinity,
                      gradient: AppColors.gradientBlueButton,
                      onPressed: () {
                        switch (step) {
                          case 0:
                            step++;
                            break;
                          case 1:
                            step++;
                            break;
                          case 2:
                            widget.onConfirm();
                            Navigator.pop(context);
                            showSuccessfulDialog(context);
                            break;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Confirm extends StatelessWidget {
  const _Confirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: SFText(
                  keyText: LocaleKeys.list_price,
                  style: TextStyles.lightGrey14),
            ),
            Expanded(
              child: SFText(
                keyText: '19 SLFT',
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: SFText(
                  keyText: LocaleKeys.artist_royalties,
                  style: TextStyles.lightGrey14),
            ),
            Expanded(
              child: SFText(
                keyText: '4%',
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: SFText(
                  keyText: LocaleKeys.transaction_fee,
                  style: TextStyles.lightGrey14),
            ),
            Expanded(
              child: SFText(
                keyText: '2%',
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: SFText(
                  keyText: LocaleKeys.listing_cancel,
                  style: TextStyles.lightGrey14),
            ),
            Expanded(
              child: SFText(
                keyText: LocaleKeys.free,
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InputPrice extends StatelessWidget {
  const _InputPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SFText(keyText: 'SLFT', style: TextStyles.blue14W700),
          ),
        ],
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SFCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SFText(
                    keyText: LocaleKeys.class_, style: TextStyles.lightGrey14),
              ),
              Expanded(
                child: SFText(
                    keyText: LocaleKeys.level,
                    args: const {'num': ''},
                    style: TextStyles.lightGrey14),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    const SFIcon(Ics.icTwoEyes, color: AppColors.blue),
                    const SizedBox(width: 12),
                    SFText(
                        keyText: LocaleKeys.middle_bed,
                        style: TextStyles.lightWhite16W700),
                  ],
                ),
              ),
              Expanded(
                child: SFText(
                    keyText: '9',
                    args: const {'num': ''},
                    style: TextStyles.lightWhite16W700),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SFText(
                    keyText: LocaleKeys.durability,
                    style: TextStyles.lightGrey14),
              ),
              Expanded(
                child: SFText(
                    keyText: LocaleKeys.bed_mint, style: TextStyles.lightGrey14),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SFText(
                    keyText: '90/100', style: TextStyles.lightWhite16W700),
              ),
              Expanded(
                child:
                    SFText(keyText: '3/7', style: TextStyles.lightWhite16W700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
