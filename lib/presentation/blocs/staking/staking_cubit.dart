import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/usecase/compound_usecase.dart';
import 'package:slee_fi/usecase/staking_info_usecase.dart';
import 'package:slee_fi/usecase/staking_usecase.dart';
import 'package:slee_fi/usecase/unstaking_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

import 'staking_state.dart';

class StakingCubit extends Cubit<StakingState> {
  StakingCubit() : super(const StakingState.initial());

  final _stakingUC = getIt<StakingUseCase>();
  final _stakingInfoUC = getIt<StakingInfoUseCase>();
  final _unStakingUC = getIt<UnStakingUseCase>();
  final _compoundUC = getIt<CompoundUseCase>();

  Future<void> init() async {
    emit(const StakingState.initial());
  }

  Future<void> getStakingInfo() async {
    final result = await _stakingInfoUC.call(NoParams());
    result.fold(
          (l) {
        emit(StakingState.error(message: '$l'));
      },
          (success) {
            emit(StakingState.stakingInfoSuccess(success));
      },
    );
  }

  Future<void> staking(double amount) async {
    final result = await _stakingUC.call(amount);
    result.fold(
          (l) {
        emit(StakingState.error(message: '$l'));
      },
          (success) {
        emit(const StakingState.stakingSuccess());
          },
    );
  }

  Future<void> unStaking() async {
    final result = await _unStakingUC.call(NoParams());
    result.fold(
          (l) {
        emit(StakingState.error(message: '$l'));
      },
          (success) {
        emit(const StakingState.unStakingSuccess());
        getStakingInfo();
      },
    );
  }

  Future<void> compound() async {
    final result = await _compoundUC.call(NoParams());
    result.fold(
          (l) {
        emit(StakingState.error(message: '$l'));
      },
          (success) {
        emit(const StakingState.compoundSuccess());
        getStakingInfo();
      },
    );
  }

}
