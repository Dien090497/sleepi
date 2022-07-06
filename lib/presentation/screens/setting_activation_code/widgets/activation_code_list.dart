import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/activation_code_setting_cubit/activation_code_setting.dart';
import 'package:slee_fi/resources/resources.dart';

class ActivationCodeList extends StatelessWidget {
  const ActivationCodeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      child:
          BlocBuilder<ActivationCodeSettingCubit, ActivationCodeSettingState>(
        builder: (context, state) {
          if (state is ActivationCodeSettingStateSuccess) {
            if (state.list.isEmpty) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SFIcon(Ics.emptyBox),
                  const SizedBox(height: 28),
                  SFText(
                    keyText: LocaleKeys.there_is_no_item,
                    style: TextStyles.lightGrey14,
                  )
                ],
              ));
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.list.length,
              shrinkWrap: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  margin: const EdgeInsets.only(top: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.white.withOpacity(0.05),
                  ),
                  child: ListTile(
                    leading: SFText(
                      keyText: "${index + 1}",
                      style: TextStyles.lightWhite16,
                      textAlign: TextAlign.center,
                    ),
                    title: SFText(
                      keyText: state.list[index].code,
                      style: TextStyles.bold16LightWhite,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: SFText(
                        keyText: state.list[index].codeUsedAt ?? "22/04 15:25",
                        style: TextStyles.lightGrey12,
                        textAlign: TextAlign.center),
                    trailing: SFText(
                      keyText: state.list[index].isUsed ? LocaleKeys.used : '',
                      style: TextStyles.blue16,
                    ),
                  ),
                );
              },
            );
          }

          if (state is ActivationCodeSettingStateError) {
            return Center(
                child: SFText(
              keyText: state.message,
              style: TextStyles.w400Red12,
            ));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
