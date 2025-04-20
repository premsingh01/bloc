import 'package:equatable/equatable.dart';

sealed class ProductPageEvent extends Equatable {
  const ProductPageEvent();

  @override
  List<Object?> get props => [];
}

class FetchProduct extends ProductPageEvent {
  const FetchProduct();
}
