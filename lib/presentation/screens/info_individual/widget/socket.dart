import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_bloc.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_state.dart';
import 'package:slee_fi/resources/resources.dart';

class Socket extends StatelessWidget {
  const Socket({Key? key, required this.bedId}) : super(key: key);
  final int bedId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketBloc, SocketState>(builder: (context, state) {
      final listJewel = <int?>[];
      var socketOpened = 0;
      if (state is SocketStateLoaded) {
        listJewel.addAll([
          state.socketEntity.jewel1,
          state.socketEntity.jewel2,
          state.socketEntity.jewel3,
          state.socketEntity.jewel4,
          state.socketEntity.jewel5,
        ]);
        socketOpened = state.socketEntity.sockets ?? 0;
      }
      return Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: List.generate(
              5,
              (index) => SFImageBorder(
                  icon: listJewel.isNotEmpty && listJewel[index] != null
                      ? Imgs.jewelPurple
                      : index < socketOpened
                          ? Ics.jewelWatting
                          : Ics.gift,
                  onTap: () {},
                  iconColor: AppColors.borderDarkColor,
                  radius: 16,
                  size: const Size(65, 65),
                  padding: 8)));
    });
  }
}
