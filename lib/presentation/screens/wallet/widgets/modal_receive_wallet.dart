import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/toast_utils.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ModalReceiveWallet extends StatelessWidget {
  const ModalReceiveWallet(
      {Key? key, required this.address, required this.networkName})
      : super(key: key);
  final String address;
  final String networkName;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(24),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SFText(
          keyText: LocaleKeys.receive,
          style: TextStyles.bold18White,
          stringCase: StringCase.upperCase,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.18),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: AppColors.blue.withOpacity(0.15)),
            child: SFText(
              keyText: networkName,
              style: TextStyles.blue14,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: QrImage(
            data: address,
            version: QrVersions.auto,
            foregroundColor: AppColors.qrColor,
            size: 180,
          ),
        ),
        const SizedBox(height: 32.0),
        SFText(
          keyText: LocaleKeys.scan_address_to_receive_payment,
          style: TextStyles.lightGrey12,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: AppColors.white.withOpacity(0.05)),
          child: SFText(
            keyText: address.formatAddress,
            style: TextStyles.lightGrey16,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
        SFButton(
          text: LocaleKeys.copy_address.reCase(StringCase.titleCase),
          textStyle: TextStyles.w600WhiteSize16,
          width: double.infinity,
          height: 48,
          gradient: AppColors.gradientBlueButton,
          onPressed: () => _copyAddress(context),
        ),
      ],
    );
  }

  _copyAddress(BuildContext context) {
    Clipboard.setData(ClipboardData(text: address));
    ToastUtils.showToast(LocaleKeys.successfully_copied);
    Navigator.pop(context);
  }
}
