import 'package:bloc/bloc.dart';
import 'package:slee_fi/presentation/blocs/product_detail/product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(const ProductDetailState.initial());
}
