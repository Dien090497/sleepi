import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = ProductDetailInitial;

  const factory ProductDetailState.loading() = ProductDetailLoading;

  const factory ProductDetailState.loaded() = ProductDetailLoaded;

  const factory ProductDetailState.error() = ProductDetailError;
}
