import 'package:bloc_study/bloc/product_page/product_page_event.dart';
import 'package:bloc_study/bloc/product_page/product_page_state.dart';
import 'package:bloc_study/model/product_page/product_page_model.dart';
import 'package:bloc_study/network/result.dart';
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
        try {
      // final List<ProductPageModel> data =
      //     await productPageRepository.fetchProductItems();
      final result = await productPageRepository.fetchProductItems();
      switch (result) {
        case Ok<List<ProductPageModel>>():
          emit(ProductPageCompletedState().copyWith(productList: result.value));
        case Error():
          emit(ProductPageFailureState(error: result.error.toString()));
      }
      // emit(ProductPageCompletedState().copyWith(productList: data));
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }
}
