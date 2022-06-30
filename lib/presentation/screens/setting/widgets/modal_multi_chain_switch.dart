import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/setting/setting_bloc.dart';
import 'package:slee_fi/presentation/blocs/setting/setting_event.dart';
import 'package:slee_fi/presentation/blocs/setting/setting_state.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalMultiChainSwitch extends StatefulWidget {
  const ModalMultiChainSwitch({Key? key}) : super(key: key);

  @override
  State<ModalMultiChainSwitch> createState() => _ModalMultiChainSwitchState();
}

class _ModalMultiChainSwitchState extends State<ModalMultiChainSwitch> {
  int selectItem = 0;
  List<String> keyText = ["AVAX Mainnet", "AVAX Testnet"];
  List icons = [Ics.icSolanaCircle, Ics.icSolanaCircle];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingBloc()..add(const GetCurrentNetWork()),
      child: BlocConsumer<SettingBloc, SettingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.read<SettingBloc>();
          return Column(
            children: [
              const SizedBox(height: 32.0),
              SFText(
                  keyText: LocaleKeys.multi_chain_switch,
                  style: TextStyles.bold18White),
              const SizedBox(height: 32.0),
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                    itemBuilder: (BuildContext context, int index) {
                      if (state is SettingLoaded) {
                        return SFCard(
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                            horizontalTitleGap: 4,
                            leading: SFIcon(icons[index]),
                            title: SFText(
                              keyText: keyText[index],
                              style: TextStyles.lightWhite16,
                            ),
                            trailing: index == 0 ? (state.network.chainId == 43114 ? const Icon(
                              Icons.check,
                              color: AppColors.green,
                              size: 32,
                            ) : const SizedBox()) : (state.network.chainId == 43113 ? const Icon(
                              Icons.check,
                              color: AppColors.green,
                              size: 32,
                            ) : const SizedBox()),
                          ),
                          onTap: () {
                            setState(() {
                              if (index == 0) {
                                bloc.add(const SwitchNetWork(NetWorkEnum.mainNet));
                              } else {
                                bloc.add(const SwitchNetWork(NetWorkEnum.testNet));
                              }
                              //Navigator.pop(context);
                            });
                          },
                        );
                      }
                      return const SizedBox();
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
