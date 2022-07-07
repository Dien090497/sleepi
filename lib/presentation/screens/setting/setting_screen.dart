import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/setting/setting_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/average_info_widget.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/general_widget.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingBloc(),
      child: BackgroundWidget(
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.setting,
          textStyle: TextStyles.bold18LightWhite,
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const AverageInfoWidget(),
              const SizedBox(height: 24),
              const GeneralWidget(),
              const SizedBox(height: 24),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, userState) {
                  if (userState is UserLoaded) {
                    return ProfileWidget(userInfo: userState.userInfoEntity);
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
