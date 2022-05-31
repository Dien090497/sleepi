import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/overlay_container.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class PopupInfoWallet extends StatefulWidget {
  const PopupInfoWallet({Key? key}) : super(key: key);

  @override
  State<PopupInfoWallet> createState() => _PopupInfoWalletState();
}

class _PopupInfoWalletState extends State<PopupInfoWallet> {

  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: _toggleDropdown,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                SFText(
                    keyText: Keys.walletAccount, style: TextStyles.blue12),
                const SizedBox(width: 6,),
                const SFIcon(Ics.icQuestion),
              ],
            ),
            OverlayContainer(
              show: _dropdownShown,
              message: Keys.displaysMessageFromWalletDetail,
            ),
          ],
        ),
      ),

    );
  }
}
