import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/entities/socket_entity/socket_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_cubit.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_bloc.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_event.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/modal_jewel_list.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/jewel_dialog_body.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';
import 'package:slee_fi/resources/resources.dart';

class SocketComponent extends StatelessWidget {
  const SocketComponent({
    Key? key,
    required this.bedId,
    required this.level,
  }) : super(key: key);
  final int bedId;
  final int level;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocketBloc, SocketState>(
      listener: (context, state) {
        if (state is SocketStateLoaded) {
          context.read<IndividualCubit>().loading(state.isLoading);
        }
        if (state is SocketStateLoaded &&
            state.errorMessage?.isNotEmpty == true) {
          showMessageDialog(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        final listJewel = <SocketEntity>[];
        var maxSocket = 0;
        if (state is SocketStateLoaded) {
          maxSocket = state.maxSocket;
          listJewel.addAll(state.socketEntity);
        }
        return Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            children: List.generate(
                5,
                (index) => index >= maxSocket
                    ? const SizedBox(width: 65, height: 65)
                    : SFImageBorder(
                        icon: index + 1 > maxSocket
                            ? Ics.gift
                            : listJewel[index].socketType == SocketType.ready
                                ? listJewel[index].jewelEntity!.image
                                : listJewel[index].socketType ==
                                        SocketType.block
                                    ? Ics.jewelWatting
                                    : '',
                        onTap: () {
                          // _showModalJewelList(context, index);
                          // _showDialogConfirmOpenSocket(context, index);
                          if (index + 1 > maxSocket) return;
                          if (listJewel[index].socketType == SocketType.block) {
                            _showDialogConfirmOpenSocket(context, index);
                          } else if (listJewel[index].socketType ==
                              SocketType.ready) {
                            _showDialogJewelDetail(
                                context, listJewel[index].jewelEntity!, index);
                          } else if (listJewel[index].socketType ==
                              SocketType.empty) {
                            _showModalJewelList(context, index);
                          }
                        },
                        iconColor: index + 1 > maxSocket
                            ? AppColors.borderDarkColor
                            : null,
                        radius: 16,
                        size: const Size(65, 65),
                        padding: 15)));
      },
    );
  }

  _showDialogConfirmOpenSocket(BuildContext context, int index) {
    showCustomDialog(context, children: [
      PopUpStaking(
          message: LocaleKeys.do_you_want_open_the_socket,
          onPressed: () {
            context.read<SocketBloc>().add(OpenSocket(index));
          })
    ]);
  }

  _showDialogJewelDetail(
      BuildContext context, JewelEntity jewelEntity, int index) {
    showCustomDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: [
        JewelDialogBody(
          jewel: jewelEntity,
          onSellTap: () {
            context.read<SocketBloc>().add(RemoveJewel(index));
            Navigator.pop(context);
          },
          onTransferTap: () {},
          textOnSell: LocaleKeys.remove,
          textOnTransfer: LocaleKeys.ok,
        ),
      ],
    );
  }

  _showModalJewelList(BuildContext context, int index) {
    SFModalBottomSheet.show(
        context, 0.8, ModalJewelList(socketBloc: context.read<SocketBloc>()));
  }
}
