import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SFIcon(
          icon,
          color: AppColors.lightGrey,
        ),
        const SizedBox(
          height: 6,
        ),
        FittedBox(
          child: SFText(
            keyText: key,
            style: TextStyles.lightGrey12,
          ),
        ),
      ],
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
              Expanded(
                child: ElevatedButton(
                      onPressed: () {
                        cubit.downLoadImage(widget: widgetCapture, controller: controller);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.transparent),
                      ),
                      child:
                          itemCommunity(context, Ics.icDownload, LocaleKeys.download),
                    ),
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      cubit.shareSocial(widget: widgetCapture, controller: controller, typeShare: ShareSocial.twitter);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.transparent),
                    ),
                    child: itemCommunity(context, Ics.twitter, LocaleKeys.twitter),
                  ),
              ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        cubit.shareSocial(widget: widgetCapture, controller: controller, typeShare: ShareSocial.facebook);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.transparent),
                      ),
                      child: itemCommunity(
                        context,
                        Ics.facebook,
                        LocaleKeys.facebook,
                      ),
                    ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.shareSocial(widget: widgetCapture, controller: controller, typeShare: ShareSocial.instagram);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.transparent),
                    ),
                    child: itemCommunity(
                      context,
                      Ics.icInstagram,
                      LocaleKeys.telegram,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
