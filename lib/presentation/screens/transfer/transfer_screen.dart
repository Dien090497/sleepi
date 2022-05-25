import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/modal_transfer_between.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_widget.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenAccent.withOpacity(0.75),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.chevron_left_circle_fill,
            color: AppColors.green,
            size: 40,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: SFText(
          keyText: Keys.transfer,
          style: TextStyles.bold20black,
          toUpperCase: true,
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.25),
          child: const TransferWidget(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: [
            const SizedBox(
              height: 32.0,
            ),
            SFText(
              keyText: Keys.asset,
              style: TextStyles.grey14Italic,
            ),
            const SizedBox(
              height: 4.0,
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) => const ModalTransferBetween());
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(width: 2, color: AppColors.black),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.ac_unit,
                    size: 32,
                  ),
                  title: SFText(
                    keyText: "SOL",
                    style: TextStyles.bold20black,
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            SFText(
              keyText: Keys.amount,
              style: TextStyles.grey14Italic,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(width: 2, color: AppColors.black),
              ),
              child: ListTile(
                title: SFText(
                  keyText: Keys.canEnterAmount,
                  style: TextStyles.bold20black,
                  toUpperCase: true,
                  textAlign: TextAlign.center,
                ),
                trailing: SFText(
                  keyText: Keys.all,
                  style: TextStyles.yellow16Italic,
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            SFText(
              keyText: "Available : 0 SOL",
              style: TextStyles.grey14Italic,
            ),
            const SizedBox(
              height: 32.0,
            ),
            SFButton(
              text: Keys.confirmTransfer,
              height: 50,
              color: AppColors.greenAccent,
              toUpperCase: true,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
