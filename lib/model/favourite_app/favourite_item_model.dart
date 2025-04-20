import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleted;
  final bool isFavourite;
  const FavouriteItemModel({
    required this.id,
    required this.value,
    this.isDeleted = false,
    this.isFavourite = false,
  });

  @override
  List<Object?> get props => [id, value, isDeleted, isFavourite];
}
