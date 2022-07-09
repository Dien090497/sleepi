import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/withdraw/withdraw_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_bloc.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_event.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class TabPendingDetail extends StatefulWidget {
  const TabPendingDetail(
      {Key? key, required this.pendingBloc, required this.attributeWithdraw})
      : super(key: key);

  final PendingBloc pendingBloc;
  final AttributeWithdraw attributeWithdraw;

  @override
  State<TabPendingDetail> createState() => _TabPendingDetailState();
}

class _TabPendingDetailState extends State<TabPendingDetail> {
  final _scrollController = ScrollController();
  final _dateTimeUtils = getIt<DateTimeUtils>();
  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    'on scroll to bottom $_isBottom'.log;
    if (_isBottom) widget.pendingBloc.add(PendingFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserBloc>().state;
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<PendingBloc, PendingState>(
            bloc: widget.pendingBloc
              ..add(PendingInit(
                userState is UserLoaded ? userState.userInfoEntity.id : 0,
                widget.attributeWithdraw,
              )),
            builder: (context, state) {
              'state is   $state'.log;
              if (state.status == PendingStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.status == PendingStatus.failure) {
                return Center(
                  child: SFText(
                      keyText: LocaleKeys.some_thing_wrong,
                      style: TextStyles.red12W700),
                );
              }
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
                  ),
                );
              }
              return SmartRefresher(
                controller: refreshController,
                enablePullDown: true,
                header: const WaterDropHeader(),
                onRefresh: () async {
                  widget.pendingBloc.add(PendingRefresh());
                  await Future.delayed(const Duration(milliseconds: 1000));
                  refreshController.loadComplete();
                },
                child: ListView.builder(
                  itemCount: state.list.length + 1,
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemBuilder: (BuildContext context, int index) =>
                      index < state.list.length
                          ? _buildItem(state.list[index])
                          : Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: state.hasReachedMax
                                  ? const SizedBox()
                                  : const CircularProgressIndicator()),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 75)
      ],
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  Widget _buildItem(WithdrawEntity withdrawEntity) {
    return SFCard(
      onTap: () async {
        final url = Uri.parse(Const.avascanUrl);
        if (await canLaunchUrl(url)) {
          launchUrl(url);
        }
      },
      radius: 8,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              CupertinoIcons.cloud_download,
              color: AppColors.blue,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(
                keyText: LocaleKeys.confirm,
                style: TextStyles.bold16Blue,
              ),
              const SizedBox(height: 4.0),
              SFText(
                keyText: _dateTimeUtils
                    .ddMMyyyyHHmm(DateTime.parse(withdrawEntity.time)),
                style: TextStyles.lightGrey14,
              ),
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SFText(
                keyText: withdrawEntity.amount,
                style: TextStyles.bold16Blue,
              ),
              const SizedBox(height: 4.0),
              SFText(
                keyText: withdrawEntity.txHash.formatAddress,
                style: TextStyles.lightGrey14,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
