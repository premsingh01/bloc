import 'package:bloc_study/model/favourite_app/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

sealed class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvent {}

class FavouriteItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  const FavouriteItem({required this.item});

}
