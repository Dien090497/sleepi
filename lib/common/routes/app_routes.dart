import 'package:slee_fi/presentation/screens/alarm/alarm_screen.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/sound_effect_screen.dart';
import 'package:slee_fi/presentation/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:slee_fi/presentation/screens/change_password/change_password_screen.dart';
import 'package:slee_fi/presentation/screens/create_wallet/create_wallet_screen.dart';
import 'package:slee_fi/presentation/screens/email/email_screen.dart';
import 'package:slee_fi/presentation/screens/enter_activation_code/enter_activation_code_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/gacha_chane_500_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/gacha_result_bed_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/gacha_result_overview.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/probability_layout.dart';
import 'package:slee_fi/presentation/screens/home/layout/feed_back_screen.dart';
import 'package:slee_fi/presentation/screens/home/layout/question_screen.dart';
import 'package:slee_fi/presentation/screens/import_wallet/import_wallet_screen.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';
import 'package:slee_fi/presentation/screens/info_individual/layout/mint_screen.dart';
import 'package:slee_fi/presentation/screens/info_individual/layout/recycle_screen.dart';
import 'package:slee_fi/presentation/screens/item_selection/item_selection_screen.dart';
import 'package:slee_fi/presentation/screens/login_signup/login_signup_screen.dart';
import 'package:slee_fi/presentation/screens/passcode/confirm_passcode_screen.dart';
import 'package:slee_fi/presentation/screens/passcode/create_passcode_screen.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/restore_wallet/restore_wallet_screen.dart';
import 'package:slee_fi/presentation/screens/result/layout/all_result_detail_screen.dart';
import 'package:slee_fi/presentation/screens/result/layout/all_result_screen.dart';
import 'package:slee_fi/presentation/screens/result/layout/share_screen.dart';
import 'package:slee_fi/presentation/screens/result/result_screen.dart';
import 'package:slee_fi/presentation/screens/seed_phrase/layouts/export_seed_phrase_screen.dart';
import 'package:slee_fi/presentation/screens/seed_phrase/layouts/show_seed_phrase_screen.dart';
import 'package:slee_fi/presentation/screens/seed_phrase/seed_phrase_screen.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';
import 'package:slee_fi/presentation/screens/setting/setting_screen.dart';
import 'package:slee_fi/presentation/screens/setting_activation_code/activation_code_screen.dart';
import 'package:slee_fi/presentation/screens/setting_permission/setting_permission_screen.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/healthcare_screen.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/motion_data_screen.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/notification_screen.dart';
import 'package:slee_fi/presentation/screens/setting_wallet/setting_wallet_screen.dart';
import 'package:slee_fi/presentation/screens/staking/layout/deposit_slft_screen.dart';
import 'package:slee_fi/presentation/screens/staking/layout/withdraw_slft_screen.dart';
import 'package:slee_fi/presentation/screens/staking/staking_screen.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/taking_screen.dart';
import 'package:slee_fi/presentation/screens/tracking/tracking_screen.dart';
import 'package:slee_fi/presentation/screens/trade/trade_screen.dart';
import 'package:slee_fi/presentation/screens/transfer/transfer_screen.dart';
import 'package:slee_fi/presentation/screens/tutorial/tutorial_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/wallet_screen.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/wallet_create_screen.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/wallet_creation_warning_screen.dart';

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
  static const String passcode = '${_}passcode';
  static const String nftInfo = '${_}nft_info';
  static const String mint = '${_}mint';
  static const String taking = '${_}taking';
  static const String staking = '${_}staking';
  static const String wallet = '${_}wallet';
  static const String setting = '${_}setting';
  static const String alarm = '${_}alarm';
  static const String alarmSoundEffect = '${_}alarm_sound_effect';
  static const String activationCode = '${_}activation_code';
  static const String permission = '${_}permission';
  static const String healthcarePermission = '${_}healthcare_permission';
  static const String motionDataPermission = '${_}motion_data_permission';
  static const String notificationPermission = '${_}notification_permission';
  static const String createWallet = '${_}create_wallet';
  static const String importWallet = '${_}import_wallet';
  static const String sendToExternal = '${_}send_to_external';
  static const String sendToSpending = '${_}send_to_spending';
  static const String trade = '${_}trade';
  static const String email = '${_}email';
  static const String changePassword = '${_}change_password';
  static const String transfer = '${_}transfer';
  static const String tutorial = '${_}tutorial';
  static const String walletCreationWarning = '${_}wallet_creation_warning';
  static const String createPasscode = '${_}create_passcode';
  static const String confirmPasscode = '${_}confirm_passcode';
  static const String itemSelection = '${_}item_selection';
  static const String question = '${_}question';
  static const String settingWallet = '${_}setting_wallet';
  static const String restoreWallet = '${_}restore_wallet';
  static const String walletCreate = '${_}wallet_create';
  static const String depositSLFT = '${_}deposit_slft';
  static const String withdrawSLFT = '${_}withdraw_slft';
  static const String result = '${_}result';
  static const String allResult = '${_}all_result';
  static const String allResultDetail = '${_}all_result_detail';
  static const String share = '${_}share';
  static const String seedPhrase = '${_}seed_phrase';
  static const String showSeedPhrase = '${_}show_seed_phrase';
  static const String exportSeedPhrase = '${_}export_seed_phrase';
  static const String probability = '${_}probability';
  static const String tracking = '${_}tracking';
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
    R.nftInfo: (_) => const InfoIndividualScreen(),
    R.mint: (_) => const MintScreen(),
    R.wallet: (_) => const WalletScreen(),
    R.staking: (_) => const StakingScreen(),
    R.taking: (_) => const TakingScreen(),
    R.setting: (_) => const SettingScreen(),
    R.alarm: (_) => const AlarmScreen(),
    R.alarmSoundEffect: (_) => const AlarmSoundEffectScreen(),
    R.activationCode: (_) => const ActivationCodeScreen(),
    R.permission: (_) => const SettingPermissionScreen(),
    R.motionDataPermission: (_) => const MotionDataPermissionScreen(),
    R.notificationPermission: (_) => const NotificationPermissionScreen(),
    R.healthcarePermission: (_) => const HealthcarePermissionScreen(),
    R.passcode: (_) => const PasscodeScreen(),
    R.createWallet: (_) => const CreateWalletScreen(),
    R.importWallet: (_) => const ImportWalletScreen(),
    R.sendToExternal: (_) => const SendToExternalScreen(),
    R.trade: (_) => const TradeScreen(),
    R.email: (_) => const EmailScreen(),
    R.changePassword: (_) => const ChangePasswordScreen(),
    R.transfer: (_) => const TransferScreen(),
    R.tutorial: (_) => const TutorialScreen(),
    R.walletCreationWarning: (_) => const WalletCreationWarningScreen(),
    R.createPasscode: (_) => const CreatePasscodeScreen(),
    R.confirmPasscode: (_) => const ConfirmPasscodeScreen(),
    R.itemSelection: (_) => const ItemSelectionScreen(),
    R.settingWallet: (_) => const SettingWalletScreen(),
    R.restoreWallet: (_) => const RestoreWalletScreen(),
    R.walletCreate: (_) => const WalletCreateScreen(),
    R.depositSLFT: (_) => const DepositSlftScreen(),
    R.withdrawSLFT: (_) => const WithdrawSlftScreen(),
    R.result: (_) => const ResultScreen(),
    R.allResult: (_) => const AllResultScreen(),
    R.allResultDetail: (_) => const AllResultDetailScreen(),
    R.share: (_) => const ShareScreen(),
    R.seedPhrase: (_) => const SeedPhraseScreen(),
    R.showSeedPhrase: (_) => const ShowSeedPhraseScreen(),
    R.exportSeedPhrase: (_) => const ExportSeedPhraseScreen(),
    R.question: (_) => const QuestionScreen(),
    R.probability: (_) => const ProbabilityScreen(),
    R.tracking: (_) => const TrackingScreen(),
  };
}
