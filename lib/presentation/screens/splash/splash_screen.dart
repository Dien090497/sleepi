import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jiffy/jiffy.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_cubit.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/screens/tracking/tracking_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void _initJiffy(BuildContext context) async {
    await Jiffy.locale(context.locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    _initJiffy(context);

    return BlocProvider(
      create: (_) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashDone) {
            if (state.isSafeDevice) {
              if (state.userInfoEntity != null) {
                context.read<UserBloc>().add(UpdateUserOrListToken(
                    userInfoEntity: state.userInfoEntity!,
                    listTokens: state.listTokens));
                if (state.userStatusTrackingModel?.tracking != null) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    R.tracking,
                    (r) => false,
                    arguments: TrackingParams(
                      timeStart:
                          state.userStatusTrackingModel!.tracking!.startSleep! *
                              1000,
                      timeWakeUp:
                          state.userStatusTrackingModel!.tracking!.wakeUp! *
                              1000,
                      tokenEarn:
                          state.userStatusTrackingModel!.tracking!.estEarn ==
                                  null
                              ? 0
                              : double.parse(state
                                  .userStatusTrackingModel!.tracking!.estEarn!),
                      fromRoute: R.splash,
                    ),
                  );
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                      context, R.bottomNavigation, (r) => false);
                }
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, R.loginSignUp, (r) => false);
              }
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, R.commingSoon, (r) => false);
            }
          }
        },
        child: const BackgroundWidget(child: Center(child: SFLogo())),
      ),
    );
  }
}
