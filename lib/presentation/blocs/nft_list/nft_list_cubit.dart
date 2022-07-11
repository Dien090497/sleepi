import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class NFTListCubit extends Cubit<NftListState> {
  NFTListCubit() : super(const NftListState.initial());
  final _fetchListBedUC = getIt<FetchBedUseCase>();

  init(int idCategory) async {
    emit(const NftListState.loading());
    getNFTList(idCategory);
  }

  refresh(int idCategory) {
    getNFTList(idCategory);
  }

  Future<void> getNFTList(int idCategory) async {
    final result = await _fetchListBedUC.call(FetchBedParam(1,100,idCategory,AttributeNFT.none));
    result.fold((l) {
      emit(NftListState.error('$l'));
    }, (success) {
      log("result : ${success.toString()}");
      emit(NftListState.loaded(success));
    });
  }
}
