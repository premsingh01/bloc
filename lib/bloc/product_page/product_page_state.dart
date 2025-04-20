import 'package:bloc_study/model/product_page/product_page_model.dart';
import 'package:equatable/equatable.dart';

sealed class ProductPageState extends Equatable {
  const ProductPageState();

  @override
  List<Object?> get props => [];
}

class ProductPageInitialState extends ProductPageState {}

class ProductPageLoadingState extends ProductPageState {}

class ProductPageCompletedState extends ProductPageState {
  final List<ProductPageModel> productList;
  const ProductPageCompletedState({this.productList = const []});

  ProductPageCompletedState copyWith({List<ProductPageModel>? productList}) {
    return ProductPageCompletedState(
      productList: productList ?? this.productList,
    );
  }

  @override
  List<Object?> get props => [productList];
}

class ProductPageFailureState extends ProductPageState {
  final String error;
  const ProductPageFailureState({required this.error});

  @override
  List<Object?> get props => [error];
}
