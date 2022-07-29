import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/share_screen/share_cubit.dart';
import 'package:slee_fi/resources/resources.dart';


class CommunityShare extends StatelessWidget {

  const CommunityShare({Key? key, required this.controller, required this.widget, required this.cubit}) : super(key: key);

  final ScreenshotController controller;
  final Widget widget;
  final ShareCubit cubit;

  Widget itemCommunity(BuildContext context, String icon, String key) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 4,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SFIcon(
            icon,
            color: AppColors.lightGrey,
          ),
          const SizedBox(
            height: 6,
          ),
          SFText(
            keyText: key,
            style: TextStyles.lightGrey12,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widgetCapture = MaterialApp(
      home: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: widget,
        ),
      ),
    );
    return Material(
      color: AppColors.dark,
      child: SafeArea(
        top: false,
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
              GestureDetector(
                onTap: () async {
                  cubit.downLoadImage(widget: widgetCapture, controller: controller);
                },
                child:
                    itemCommunity(context, Ics.icDownload, LocaleKeys.download),
              ),
              GestureDetector(
                onTap: () {
                  cubit.shareSocial(widget: widgetCapture, controller: controller, typeShare: ShareSocial.twitter);
                },
                child: itemCommunity(context, Ics.twitter, LocaleKeys.twitter),
              ),
              GestureDetector(
                onTap: () {
                  cubit.shareSocial(widget: widgetCapture, controller: controller, typeShare: ShareSocial.facebook);
                },
                child: itemCommunity(
                  context,
                  Ics.facebook,
                  LocaleKeys.facebook,
                ),
              ),
              GestureDetector(
                onTap: () {
                  cubit.shareSocial(widget: widgetCapture, controller: controller, typeShare: ShareSocial.instagram);
                },
                child: itemCommunity(
                  context,
                  Ics.telegram,
                  LocaleKeys.telegram,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
