import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class TopBarCommon extends StatelessWidget {
  const TopBarCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, R.setting),
            child: const Icon(
              Icons.settings,
              size: 50,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.primary),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        size: 20,
                      ),
                      SFText(
                        keyText: '68.8',
                        style: TextStyles.textBasic15,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.money,
                        size: 20,
                      ),
                      SFText(
                        keyText: '68.88',
                        style: TextStyles.textBasic15,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.attach_money,
                        size: 20,
                      ),
                      SFText(
                        keyText: '88.99',
                        style: TextStyles.textBasic15,
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Icon(
                    Icons.cached_sharp,
                    size: 35,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
