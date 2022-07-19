import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/individual_point/individual_point_cubit.dart';
import 'package:slee_fi/presentation/blocs/individual_point/individual_point_state.dart';

class PointDialog extends StatelessWidget {
  const PointDialog({Key? key, required this.bed}) : super(key: key);

  final BedEntity bed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndividualPointCubit(bed)..getPoint(),
      child: BlocConsumer<IndividualPointCubit, IndividualPointState>(
        listener: (context, state) {
          if (state is IndividualPointError) {
            showMessageDialog(context, state.msg);
          }
          if (state is IndividualPointDone) {
            Navigator.popUntil(context, (r) => r.settings.name == R.nftInfo);
          }
        },
        buildWhen: (prev, cur) => cur is IndividualPointInitial,
        builder: (context, state) {
          final cubit = context.read<IndividualPointCubit>();
          final point = state is IndividualPointInitial
              ? state.point?.removeTrailingZeros ?? '-'
              : '-';

          return Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: Icon(
                      Icons.close,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
              ),
              SFTextField(
                key: Key(point),
                labelText: LocaleKeys.point,
                enabled: false,
                initialText: point,
              ),
              const SizedBox(height: 16),
              if (state is IndividualPointInitial)
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.startAttributes.length,
                  separatorBuilder: (_, i) => SizedBox(height: 16.h),
                  itemBuilder: (context, i) {
                    final startPoint = state.startAttributes[i];
                    final distributePoint = state.attributesDistributed[i];
                    return _IncreasePoint(
                      title: state.attributesNames[i],
                      addTap: () {
                        cubit.increase(i);
                      },
                      minusTap: () {
                        cubit.decrease(i);
                      },
                      point: startPoint + distributePoint,
                      startPoint: startPoint,
                      key: Key('${startPoint + distributePoint}'),
                    );
                  },
                ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SFButton(
                      width: double.infinity,
                      color: AppColors.light4,
                      text: LocaleKeys.cancel,
                      textStyle: TextStyles.lightGrey16,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  if (state is IndividualPointInitial)
                    Expanded(
                      child: state.isLoading
                          ? const LoadingIcon()
                          : SFButton(
                              width: double.infinity,
                              textStyle: TextStyles.white16,
                              gradient: AppColors.gradientBlue,
                              text: LocaleKeys.confirm,
                              onPressed: () {
                                cubit.updateAttribute();
                              },
                            ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _IncreasePoint extends StatelessWidget {
  const _IncreasePoint({
    Key? key,
    required this.title,
    required this.point,
    required this.startPoint,
    required this.minusTap,
    required this.addTap,
  }) : super(key: key);

  final String title;
  final double point;
  final double startPoint;
  final VoidCallback minusTap;
  final VoidCallback addTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SFText(keyText: title, style: TextStyles.lightGrey14),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
                child: SFTextField(
              showLabel: false,
              enabled: false,
              initialText: point.removeTrailingZeros,
              textStyle:
                  startPoint != point ? TextStyles.blue16 : TextStyles.white16,
            )),
            const SizedBox(width: 16),
            _Button(icon: Icons.remove, onTap: minusTap),
            const SizedBox(width: 8),
            _Button(icon: Icons.add, onTap: addTap),
          ],
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: AppColors.blue.withOpacity(0.2),
        hoverColor: AppColors.blue.withOpacity(0.2),
        splashColor: AppColors.blue.withOpacity(0.2),
        radius: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.blue),
        ),
      ),
    );
  }
}
