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
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';
import 'package:slee_fi/resources/resources.dart';

import 'jewel_dialog_body.dart';
import 'modal_jewel_list.dart';

class SocketComponent extends StatelessWidget {
  const SocketComponent({
    Key? key,
    required this.bedId,
    required this.level,
    required this.updateJewelSuccess,
  }) : super(key: key);
  final int bedId;
  final int level;
  final Function() updateJewelSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocketBloc, SocketState>(
      listenWhen: (previous, current) {
        if (previous is SocketStateLoaded &&
            current is SocketStateLoaded &&
            previous.socketEntity
                    .where((element) => element.socketType == SocketType.ready)
                    .length !=
                current.socketEntity
                    .where((element) => element.socketType == SocketType.ready)
                    .length) {
          updateJewelSuccess();
        }

        return true;
      },
      listener: (context, state) {
        if (state is SocketStateLoaded) {
          context.read<IndividualCubit>().loading(state.isLoading);
          if (state.bedEntity != null) {
            context.read<IndividualCubit>().updateBed(state.bedEntity!);
          }
        }
        if (state is SocketStateLoaded &&
            state.errorMessage?.isNotEmpty == true) {
          showMessageDialog(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        final sockets = <SocketEntity>[];
        var maxSocket = 0;
        if (state is SocketStateLoaded) {
          maxSocket = state.maxSocket;
          sockets.addAll(state.socketEntity);
        }
        return Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            children: List.generate(
                5,
                (index) => SFImageBorder(
                    icon: index + 1 > maxSocket
                        ? Ics.icSocketWaitingToPay
                        : sockets[index].socketType == SocketType.ready
                            ? sockets[index].jewelEntity!.image
                            : sockets[index].socketType == SocketType.block
                                ? Ics.icSocketWaitingToPay
                                : Ics.icSocketEmpty,
                    onTap: () {
                      if (index + 1 > maxSocket) return;
                      // showComingSoonDialog(context);
                      if (sockets[index].socketType == SocketType.block) {
                        _showDialogConfirmOpenSocket(context, index);
                      } else if (sockets[index].socketType ==
                          SocketType.ready) {
                        _showDialogJewelDetail(
                            context, sockets[index].jewelEntity!, index);
                      } else if (sockets[index].socketType ==
                          SocketType.empty) {
                        _showModalJewelList(context, index);
                      }
                    },
                    iconColor: index + 1 > maxSocket
                        ? AppColors.borderDarkColor
                        : sockets[index].socketType == SocketType.ready
                            ? null
                            : sockets[index].socketType == SocketType.block
                                ? AppColors.blue
                                : AppColors.borderDarkColor,
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

  void _showDialogConfirmRemoveJewel(BuildContext context, int index) {
    showCustomDialog(context, children: [
      PopUpStaking(
          message: LocaleKeys.taking_off_jewel_with_cost,
          onPressed: () {
            context.read<SocketBloc>().add(RemoveJewel(index));
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
            Navigator.pop(context);
            _showDialogConfirmRemoveJewel(context, index);
          },
          onTransferTap: () {
            Navigator.pop(context);
          },
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
