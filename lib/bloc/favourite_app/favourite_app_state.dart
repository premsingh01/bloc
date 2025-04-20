import 'package:bloc_study/model/favourite_app/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { init, loading, completed, error }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final ListStatus listStatus;
  const FavouriteAppState({
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.init,
    });

  FavouriteAppState copyWith({List<FavouriteItemModel>? favouriteItemList, ListStatus? listStatus}) {
    return FavouriteAppState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      listStatus: listStatus ?? this.listStatus
    );
  }

  @override
  List<Object?> get props => [favouriteItemList, listStatus];
}
