import 'package:dartz/dartz.dart' as dartz;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/usecase/estimate_nft_function_fee_usecase.dart';
import 'package:slee_fi/usecase/is_valid_wallet_address_usecase.dart';

class NftPopUpTransfer extends StatelessWidget {
  const NftPopUpTransfer({
    Key? key,
    required this.onConfirm,
    required this.nft,
    required this.ownerAddress,
    this.onCancel,
    this.isToSpending,
  }) : super(key: key);

  final bool? isToSpending;
  final Function(String address) onConfirm;
  final VoidCallback? onCancel;
  final NFTEntity nft;
  final String ownerAddress;

  @override
  Widget build(BuildContext context) {
    String toAddress = '';
    final errorNotifier = ValueNotifier<String>('');

    return Stack(
      children: [
        Positioned(
          right: 0,
          child: GestureDetector(
            onTap: () {
              if (onCancel != null) {
                onCancel!();
              }
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        Column(
          children: [
            SFText(
              keyText: LocaleKeys.confirm_transfer,
              style: TextStyles.white1w700size16,
            ),
            const SizedBox(height: 20),
            if (isToSpending ?? false)
              SFCard(
                margin: EdgeInsets.zero,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SFText(
                          keyText: LocaleKeys.from,
                          style: TextStyles.lightGrey12,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: SFText(
                            keyText: LocaleKeys.to,
                            style: TextStyles.lightGrey12,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        SFText(
                          keyText: LocaleKeys.wallet,
                          style: TextStyles.bold16LightWhite,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: SFText(
                            keyText: LocaleKeys.spending,
                            style: TextStyles.bold16LightWhite,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            else
              _AddressTextField(
                errorNotifier: errorNotifier,
                onChanged: (String value) {
                  toAddress = value;
                },
              ),
            const SizedBox(height: 24),
            Row(
              children: [
                SFText(
                  keyText: LocaleKeys.fee,
                  style: TextStyles.lightGrey12,
                ),
                const SizedBox(width: 4),
                if ((nft.attribute?.contractAddress?.isNotEmpty ?? false) &&
                    nft.attribute?.tokenId != null)
                  Expanded(
                    child: FutureBuilder<dartz.Either<Failure, double>>(
                      future: getIt<EstimateNftFunctionFeeUseCase>()
                          .call(EstimateGasParams(
                        nftAddress: nft.attribute!.contractAddress!,
                        ownerAddress: ownerAddress,
                        toAddress: toAddress,
                        nftId: nft.attribute!.tokenId!,
                        functionName: 'transferFrom',
                      )),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.hasData
                              ? '${snapshot.data!.getOrElse(() => 0)} AVAX'
                              : '--.--',
                          textAlign: TextAlign.right,
                          style: TextStyles.white12,
                        );
                      },
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SFText(
                  keyText: LocaleKeys.you_will_transfer,
                  style: TextStyles.lightGrey12,
                ),
                const SizedBox(width: 4),
                Expanded(
                    child: SFText(
                  keyText: '#${nft.attribute?.tokenId}',
                  textAlign: TextAlign.right,
                  style: TextStyles.white12,
                )),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.cancel,
                    onPressed: () {
                      if (onCancel != null) {
                        onCancel!();
                      }
                      Navigator.pop(context);
                    },
                    textStyle: TextStyles.lightGrey16,
                    color: AppColors.light4,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.confirm,
                    onPressed: () {
                      getIt<IsValidWalletAddressUseCase>().call(toAddress).fold(
                        (l) {
                          errorNotifier.value =
                              LocaleKeys.this_field_is_required.tr();
                        },
                        (r) {
                          onConfirm(toAddress);
                        },
                      );
                    },
                    width: double.infinity,
                    textStyle: TextStyles.white16,
                    gradient: AppColors.gradientBlueButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _AddressTextField extends StatefulWidget {
  const _AddressTextField(
      {Key? key, required this.errorNotifier, required this.onChanged})
      : super(key: key);

  final ValueNotifier<String> errorNotifier;
  final ValueChanged<String> onChanged;

  @override
  State<_AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<_AddressTextField> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: widget.errorNotifier,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SFText(
                keyText: LocaleKeys.wallet_address,
                style: TextStyles.lightGrey14),
            const SizedBox(height: 8),
            child!,
            SFText(keyText: value, style: TextStyles.red12W700),
          ],
        );
      },
      child: SFTextField(
        onChanged: widget.onChanged,
        showLabel: false,
      ),
    );
  }
}
