import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';

class ListTransferNftWidget extends StatefulWidget {
  const ListTransferNftWidget(
      {Key? key, required this.onTap, required this.nftDetailCubit})
      : super(key: key);

  final VoidCallback onTap;
  final NftDetailCubit nftDetailCubit;

  @override
  State<ListTransferNftWidget> createState() => _ListTransferNftWidgetState();
}

class _ListTransferNftWidgetState extends State<ListTransferNftWidget> {
  final refreshController = RefreshController();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NftDetailCubit, NftDetailState>(
      bloc: widget.nftDetailCubit,
      builder: (context, state) {
        if (state is NftDetailLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(
                  keyText: LocaleKeys.transfer, style: TextStyles.white18W700),
              const SizedBox(height: 12),
              Expanded(
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullUp: state.hasMore,
                  enablePullDown: true,
                  onRefresh: () {
                    widget.nftDetailCubit.refresh().then((_) {
                      refreshController.refreshCompleted();
                    });
                  },
                  onLoading: () {
                    widget.nftDetailCubit.loadMore().then((_) {
                      refreshController.loadComplete();
                    });
                  },
                  child: ListView.separated(
                    itemCount: state.nftEntities.length,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemBuilder: (context, index) {
                      final nft = state.nftEntities[index];
                      final bedType =
                          BedType.values[index % BedType.values.length];

                      return GestureDetector(
                        onTap: widget.onTap,
                        child: TransferNftWidget(
                          bedType: bedType,
                          bedId: nft.attribute.tokenId,
                        ),
                      );
                    },
                    separatorBuilder: (_, i) => const SizedBox(height: 12),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class TransferNftWidget extends StatelessWidget {
  const TransferNftWidget({
    Key? key,
    required this.bedType,
    required this.bedId,
  }) : super(key: key);

  final BedType bedType;
  final int bedId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteOpacity5,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          SFIcon(bedType.image, width: 70, height: 70),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$bedId', style: TextStyles.lightWhite16W700),
              const SizedBox(height: 4),
              Text(bedType.type.reCase(StringCase.titleCase),
                  style: TextStyles.lightWhite16W700),
            ],
          ),
        ],
      ),
    );
  }
}
