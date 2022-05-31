import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/overlay_container.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class PopupInfoStaking extends StatefulWidget {
  const PopupInfoStaking({Key? key}) : super(key: key);

  @override
  State<PopupInfoStaking> createState() => _PopupInfoStakingState();
}

class _PopupInfoStakingState extends State<PopupInfoStaking> {
  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleDropdown,
            child: const SFIcon(
              Ics.icQuestion,
              color: AppColors.lightGrey,
              width: 18,
            ),
          ),
          OverlayContainer(
            show: _dropdownShown,
            width: 200,
            height: 130,
            position: const OverlayContainerPosition(-180, 0),
            message: LocaleKeys.displaysMessageFromStakingSlftDetail,
          ),
        ],
      ),
    );
  }
}
