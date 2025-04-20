import 'package:bloc_study/model/favourite_app/favourite_item_model.dart';

class FavouriteAppRepository {
  Future<List<FavouriteItemModel>> fetchItems() async {
    return _generateItemList(length: 10);
  }

  List<FavouriteItemModel> _generateItemList({required int length}) {
    return List.generate(
      length,
      (index) => FavouriteItemModel(id: "$index", value: 'Item $index'),
    );
  }
}
