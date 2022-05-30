import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/overlay_container.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
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
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleDropdown,
            child: const SFIcon(Ics.icQuestion),
          ),
          OverlayContainer(
            show: _dropdownShown,
            position: const OverlayContainerPosition(-120, 0),
            message: Keys.displaysMessageFromWalletDetail,
          ),
        ],
      ),
    );
  }
}
