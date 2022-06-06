import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/pop_up_level_up.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_repair.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_transfer.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/pop_up_sell.dart';
import 'package:slee_fi/resources/resources.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int index = -1;

  Widget itemBottomBar(int i, BuildContext context, String icon, String key,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 6,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SFIcon(
              icon,
              color: index == i ? AppColors.blue : AppColors.lightGrey,
            ),
            const SizedBox(
              height: 6,
            ),
            SFText(
              keyText: key,
              style: index == i ? TextStyles.blue12 : TextStyles.lightGrey12,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.dark,
            border: Border(
                top: BorderSide(
              width: 1,
              color: AppColors.lightDark,
            ))),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            itemBottomBar(0, context, Ics.levelUp, LocaleKeys.level_up, () {
              setState(() {
                index = 0;
              });
              showCustomDialog(
                context,
                children: [
                  PopUpLevelUp(
                      icon: Ics.middleBed,
                      level: 20,
                      cost: 21,
                      time: 1260,
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onConfirm: () {}),
                ],
              ).then((value) => setState(() {
                    setState(() {
                      index = -1;
                    });
                  }));
            }),
            itemBottomBar(1, context, Ics.repair, LocaleKeys.repair, () {
              setState(() {
                index = 1;
              });
              showCustomDialog(
                context,
                children: [
                  PopUpRepair(
                    icon: Ics.middleBed,
                    cost: 120,
                    level: 20,
                    time: 122,
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    onConfirm: () {},
                  ),
                ],
              ).then((value) => setState(() {
                    setState(() {
                      index = -1;
                    });
                  }));
            }),
            itemBottomBar(2, context, Ics.heart, LocaleKeys.mint, () {
              setState(() {
                index = 2;
              });
              Navigator.pushNamed(context, R.mint).then((value) => setState(() {
                    index = -1;
                  }));
            }),
            itemBottomBar(3, context, Ics.shopping, LocaleKeys.sell, () {
              setState(() {
                index = 3;
              });
              showCustomDialog(context, children: [
                PopUpSell(
                  time: 1,
                  cost: 1,
                  icon: Ics.middleBed,
                  level: 2,
                  onCancel: () {},
                  onConfirm: () {},
                ),
              ]).then((value) => setState(() {
                    setState(() {
                      index = -1;
                    });
                  }));
            }),
            itemBottomBar(4, context, Ics.recycling, LocaleKeys.recycle, () {
              setState(() {
                index = 4;
              });
              Navigator.pushNamed(context, R.recycle)
                  .then((value) => setState(() {
                        index = -1;
                      }));
            }),
            itemBottomBar(5, context, Ics.transfer, LocaleKeys.transfer, () {
              setState(() {
                index = 5;
              });
              showCustomDialog(
                context,
                children: [
                  PopUpTransfer(
                    onConfirm: () {},
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    valueTransfer: 1,
                    fee: 1,
                  )
                ],
              ).then((value) => setState(() {
                    setState(() {
                      index = -1;
                    });
                  }));
            }),
          ],
        ),
      ),
    );
  }
}
