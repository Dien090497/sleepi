import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_bloc.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_event.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class TabPendingDetail extends StatefulWidget {
  const TabPendingDetail({Key? key, required this.pendingBloc})
      : super(key: key);

  final PendingBloc pendingBloc;

  @override
  State<TabPendingDetail> createState() => _TabPendingDetailState();
}

class _TabPendingDetailState extends State<TabPendingDetail> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
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
                  userState is UserLoaded ? userState.userInfoEntity.id : 0)),
            builder: (context, state) {
              if (state.status == PendingStatus.initial) {
                return const Center(child: CircularProgressIndicator());
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
              return ListView.builder(
                itemCount: state.list.length + 1,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemBuilder: (BuildContext context, int index) =>
                    index < state.list.length
                        ? _buildItem()
                        : Container(
                            height: 60,
                            alignment: Alignment.center,
                            child: state.hasReachedMax
                                ? const SizedBox()
                                : const CircularProgressIndicator()),
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
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  Widget _buildItem() {
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
                keyText: "27/04/2022  14:08",
                style: TextStyles.lightGrey14,
              ),
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SFText(
                keyText: "+1 NFT",
                style: TextStyles.bold16Blue,
              ),
              const SizedBox(height: 4.0),
              SFText(
                keyText: "53LqDpU...wihRe3",
                style: TextStyles.lightGrey14,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
