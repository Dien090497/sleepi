import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/widgets/container_box_widget.dart';

class TransferWidget extends StatefulWidget {
  const TransferWidget({Key? key}) : super(key: key);

  @override
  State<TransferWidget> createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  bool swapText = false;

  @override
  Widget build(BuildContext context) {
    return ContainerBoxWidget(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.account_tree,
                      color: AppColors.greenAccent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SFText(
                        keyText: Keys.from,
                        style: TextStyles.grey14Italic,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SFText(
                    keyText: swapText ? Keys.spending : Keys.wallet,
                    style: TextStyles.bold16blackItalic),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  swapText = !swapText;
                });
              },
              child: const Icon(
                Icons.swap_vert,
                size: 32,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: AppColors.greenAccent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SFText(
                        keyText: Keys.to,
                        style: TextStyles.grey14Italic,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SFText(
                  keyText: swapText ? Keys.wallet : Keys.spending,
                  style: TextStyles.bold16blackItalic,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
