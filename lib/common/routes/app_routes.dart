import 'package:slee_fi/presentation/screens/alarm/alarm_screen.dart';
import 'package:slee_fi/presentation/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:slee_fi/presentation/screens/enter_activation_cde/enter_activation_code_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/gacha_chane_500_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/gacha_result_bed_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/gacha_result_overview.dart';
import 'package:slee_fi/presentation/screens/home/layout/feed_back_screen.dart';
import 'package:slee_fi/presentation/screens/info_nft/layout/mint_screen.dart';
import 'package:slee_fi/presentation/screens/info_nft/layout/recycle_screen.dart';
import 'package:slee_fi/presentation/screens/info_nft/info_nft_screen.dart';
import 'package:slee_fi/presentation/screens/login_signup/login_signup_screen.dart';
import 'package:slee_fi/presentation/screens/setting/setting_screen.dart';

import '../../presentation/screens/alarm/widgets/sound_effect_screen.dart';
import '../../presentation/screens/staking/staking_screen.dart';
import '../../presentation/screens/staking/widgets/taking_screen.dart';
import '../../presentation/screens/wallet/wallet_screen.dart';

class R {
  static const String _ = '/';
  static const String loginSignUp = '${_}login_signup';
  static const String enterActivationCode = '${_}enter_activation_code';
  static const String bottomNavigation = '${_}bottom_navigation';
  static const String recycle = '${_}recycle';
  static const String feedback = '${_}feedback';
  static const String gacha500TimesChance = '${_}gacha_500_times_chance';
  static const String gachaResultBed = '${_}gacha_result_bed';
  static const String gachaResultOverview = '${_}gacha_result_overview';
  static const String nftInfo = '${_}nft_info';
  static const String mint = '${_}mint';
  static const String taking = '${_}taking';
  static const String staking = '${_}staking';
  static const String wallet = '${_}wallet';
  static const String setting = '${_}setting';
  static const String alarm = '${_}alarm';
  static const String alarmSoundEffect = '${_}alarm_sound_effect';
}

class AppRoutes {
  static final routes = {
    R.loginSignUp: (_) => const LoginSignUpScreen(),
    R.enterActivationCode: (_) => const EnterActivationCodeScreen(),
    R.bottomNavigation: (_) => const BottomNavigationScreen(),
    R.recycle: (_) => const RecycleScreen(),
    R.feedback: (_) => const FeedBackScreen(),
    R.gacha500TimesChance: (_) => const GachaChance500Screen(),
    R.gachaResultBed: (_) => const GachaResultBedScreen(),
    R.gachaResultOverview: (_) => const GachaResultOverview(),
    R.nftInfo: (_) => const InfoNftScreen(),
    R.mint: (_) => const MintScreen(),
    R.wallet: (_) => const WalletScreen(),
    R.staking: (_) => const StakingScreen(),
    R.taking: (_) => const TakingScreen(),
    R.setting: (_) => const SettingScreen(),
    R.alarm: (_) => const AlarmScreen(),
    R.alarmSoundEffect: (_) => const AlarmSoundEffectScreen(),
  };
}
