import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_cubit.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashDone) {
          if (state.isSafeDevice) {
            Navigator.pushReplacementNamed(context, R.loginSignUp);
          } else {
            Navigator.pushReplacementNamed(context, R.commingSoon);
          }
        }
      },
      child: const BackgroundWidget(
        child: Center(child: SFLogo()),
      ),
    );
  }
}