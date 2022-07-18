import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_cubit.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_state.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_bloc.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/bottom_bar.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/bottom_bar_market_place.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/box_info_widget.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/individual_refresher.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/mint_from_widget.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/socket_component.dart';

class InfoIndividualParams {
  final bool? buy;
  final BedEntity bed;
  final MarketPlaceModel? marketPlaceModel;

  InfoIndividualParams({this.buy, required this.bed, this.marketPlaceModel});
}

class InfoIndividualScreen extends StatelessWidget {
  const InfoIndividualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as InfoIndividualParams;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IndividualCubit(args.bed)),
        BlocProvider(create: (context) => SocketBloc()),
      ],
      child: Stack(
        children: [
          BackgroundWidget(
            child: SafeArea(
              child: Column(
                children: [
                  BlocBuilder<IndividualCubit, IndividualState>(
                    builder: (context, state) {
                      return TopBarCommon(iconBack: true, results: state.bed);
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: BlocBuilder<IndividualCubit, IndividualState>(
                      builder: (context, state) {
                        return WillPopScope(
                          onWillPop: () {
                            Navigator.pop(context, state.bed);
                            return Future(() => false);
                          },
                          child: IndividualRefresher(
                            child: ListView(
                              children: [
                                Container(
                                  height: 180,
                                  width: 180,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 24),
                                  child: SFIcon(state.bed.image),
                                ),
                                SocketComponent(
                                  bedId: state.bed.id,
                                  level: state.bed.level,
                                ),
                                const SizedBox(height: 16),
                                BoxInfoWidget(bed: state.bed),
                                const SizedBox(height: 24),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SFText(
                                          keyText: LocaleKeys.attributes,
                                          style: TextStyles.bold18LightWhite,
                                        ),
                                      ),
                                      SFButtonOutLined(
                                        title: LocaleKeys.base,
                                        textStyle: TextStyles.bold14Blue,
                                        borderColor: AppColors.blue,
                                        onPressed: () {},
                                      ),
                                      const SizedBox(width: 8),
                                      if (args.marketPlaceModel == null)
                                        SFButton(
                                          height: 38,
                                          text: "+ ${LocaleKeys.point.tr()}",
                                          textStyle: TextStyles.boldWhite14,
                                          gradient:
                                              AppColors.gradientBlueButton,
                                          onPressed: () {
                                            _showPointDialog(context);
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                AttributesWidget(
                                  bonus: state.bed.bonus,
                                  efficiency: state.bed.efficiency,
                                  luck: state.bed.luck,
                                  resilience: state.bed.resilience,
                                  special: state.bed.special,
                                ),
                                const SizedBox(height: 33),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.dark,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      MintFromWidget(
                                        title: LocaleKeys.minted_from,
                                        familyData: state.nftFamily?.parent,
                                      ),
                                      MintFromWidget(
                                        title: LocaleKeys.mint,
                                        familyData: state.nftFamily?.children,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 80),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: args.marketPlaceModel != null && (args.buy ?? false)
                ? BottomBarMarketPlaceWidget(bed: args.marketPlaceModel!)
                : BottomBarWidget(
                    bedEntity: args.bed,
                  ),
          )
        ],
      ),
    );
  }

  Future _showPointDialog(BuildContext context) {
    return showCustomDialog(
      context,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}
