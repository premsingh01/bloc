import 'package:bloc_study/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_study/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_study/model/favourite_app/favourite_item_model.dart';
import 'package:bloc_study/repository/favourite_app/favourite_app_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  List<FavouriteItemModel> favouriteList = [];
  FavouriteAppRepository favouriteAppRepository;

  FavouriteAppBloc(this.favouriteAppRepository)
    : super(const FavouriteAppState()) {
    on<FetchFavouriteList>(_fetchFavouriteList);
    on<FavouriteItem>(_favouriteItem);
  }

  _fetchFavouriteList(
    FetchFavouriteList event,
    Emitter<FavouriteAppState> emit,
  ) async {
    favouriteList = await favouriteAppRepository.fetchItems();
    emit(state.copyWith(listStatus: ListStatus.loading));
    await Future.delayed(Duration(seconds: 2));
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.completed,
      ),
    );
  }

  _favouriteItem(FavouriteItem event, Emitter<FavouriteAppState> emit) {
    int index = favouriteList.indexWhere(
      (element) => element.id == event.item.id,
    );
    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }
}
