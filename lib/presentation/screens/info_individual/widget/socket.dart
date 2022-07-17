import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/entities/socket_entity/socket_entity.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_bloc.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_event.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_state.dart';
import 'package:slee_fi/resources/resources.dart';

class Socket extends StatelessWidget {
  const Socket({
    Key? key,
    required this.bedId,
    required this.level,
  }) : super(key: key);
  final int bedId;
  final int level;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketBloc, SocketState>(
      bloc: BlocProvider.of<SocketBloc>(context)..add(SocketInt(bedId, level)),
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
                (index) => SFImageBorder(
                    icon: index + 1 > maxSocket
                        ? Ics.gift
                        : listJewel[index].image,
                    onTap: () {
                      if (index + 1 > maxSocket) return;
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
}
