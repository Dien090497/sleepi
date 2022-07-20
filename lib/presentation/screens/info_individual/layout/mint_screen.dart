import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/launch_url_utils.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_cubit.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/connect_bed_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class MintScreen extends StatefulWidget {
  const MintScreen({Key? key}) : super(key: key);

  @override
  State<MintScreen> createState() => _MintScreenState();
}

class _MintScreenState extends State<MintScreen> {
  bool swCheck = true;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as BedEntity;
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => MintCubit()..init(args.nftId),
      child: BlocConsumer<MintCubit, MintState>(
        listener: (context, state) {
          final cubit = context.read<MintCubit>();
          if (state is MintStateLoaded && state.statusMint) {
            showSuccessfulDialog(context, null);
          }
          if (state is MintStateError) {
            showMessageDialog(context, state.msg).then((value) {
              cubit.refresh();
            });
          }
        },
        builder: (context, state) {
          final cubit = context.read<MintCubit>();
          return BackgroundWidget(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: SFAppBar(
                context: context,
                title: LocaleKeys.bed_mint,
                textStyle: TextStyles.boldWhite18,
              ),
              body: Stack(
                children: [
                  SafeArea(
                    top: false,
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: size.height,
                        ),
                        child: IntrinsicHeight(
                          child: state is MintStateLoaded
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ConnectBedWidget(
                                            bedParent1: args,
                                          ),
                                          const SizedBox(
                                            height: 60,
                                          ),
                                          SFLabelValue(
                                            label:
                                                LocaleKeys.token_consumptions,
                                            value: state.infoMinting != null
                                                ? '${state.infoMinting!.fee} SLFT'
                                                : '',
                                            styleValue: TextStyles.lightWhite14,
                                            styleLabel: TextStyles.lightWhite14,
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${LocaleKeys.insurance.tr()}: ${args.insurancePercent}%',
                                                style:
                                                    TextStyles.bold16LightWhite,
                                              ),
                                              SizedBox(
                                                height: 24,
                                                child: CupertinoSwitch(
                                                  activeColor: AppColors.green,
                                                  value: state.enableInsurance,
                                                  onChanged: (value) {
                                                    cubit.changeEnableInsurance(
                                                        value);
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              launchInsurance(context);
                                            },
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SFText(
                                                  keyText: LocaleKeys
                                                      .what_is_insurance,
                                                  style: TextStyles.lightGrey12,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                const SFIcon(
                                                    Ics.icCircleQuestion),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 20,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: AppColors.dark,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            topLeft: Radius.circular(40),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SFText(
                                              keyText: LocaleKeys
                                                  .without_insurance_case,
                                              style: TextStyles.lightGrey14,
                                            ),
                                            const SizedBox(height: 12),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.white
                                                    .withOpacity(0.05),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Column(
                                                children: [
                                                  SFLabelValue(
                                                    label: LocaleKeys
                                                        .common_bed_box,
                                                    styleLabel:
                                                        TextStyles.lightWhite14,
                                                    value: state.infoMinting !=
                                                            null
                                                        ? '${100 - state.infoMinting!.brokenRate.brokenRate}%'
                                                        : '',
                                                    colorBorder:
                                                        Colors.transparent,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16.0),
                                                    child: Divider(
                                                      height: 1,
                                                      color: Colors.white
                                                          .withOpacity(0.05),
                                                    ),
                                                  ),
                                                  SFLabelValue(
                                                    label: LocaleKeys
                                                        .one_bed_will_be_burned,
                                                    styleLabel:
                                                        TextStyles.lightWhite14,
                                                    value: state.infoMinting !=
                                                            null
                                                        ? '${state.infoMinting!.brokenRate.brokenRate}%'
                                                        : '',
                                                    colorBorder:
                                                        Colors.transparent,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            SFText(
                                              keyText: LocaleKeys
                                                  .with_insurance_case,
                                              style: TextStyles.lightGrey14,
                                            ),
                                            const SizedBox(height: 17),
                                            SFLabelValue(
                                                label: LocaleKeys.bedbox,
                                                styleLabel:
                                                    TextStyles.lightWhite14,
                                                value: state.infoMinting != null
                                                    ? '100%'
                                                    : ''),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    )
                                  ],
                                )
                              : Container(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Material(
                      color: AppColors.dark,
                      child: SafeArea(
                        top: false,
                        child: Container(
                          padding: const EdgeInsets.only(
                              bottom: 20, left: 16, right: 16, top: 12),
                          child: SFButton(
                            text: LocaleKeys.mint,
                            width: size.width,
                            gradient: AppColors.gradientBlueButton,
                            textStyle: TextStyles.white16,
                            disabled: state is MintStateLoaded
                                ? state.indexSelected == -1
                                : true,
                            onPressed: () {
                              cubit.mint();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
