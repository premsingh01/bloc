import 'package:bloc_study/bloc/product_page/product_page_event.dart';
import 'package:bloc_study/bloc/product_page/product_page_state.dart';
import 'package:bloc_study/model/product_page/product_page_model.dart';
import 'package:bloc_study/repository/product_page/product_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPageBloc extends Bloc<ProductPageEvent, ProductPageState> {
  ProductPageRepository productPageRepository;
  ProductPageBloc(this.productPageRepository)
    : super(ProductPageInitialState()) {
    on<FetchProduct>(_fetchProduct);
  }

  _fetchProduct(FetchProduct event, Emitter<ProductPageState> emit) async {
    emit(ProductPageLoadingState());

    try {
      final List<ProductPageModel> data =
          await productPageRepository.fetchProductItems();
      emit(ProductPageCompletedState().copyWith(productList: data));
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }
}
