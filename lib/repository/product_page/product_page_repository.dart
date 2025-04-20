import 'package:bloc_study/model/product_page/product_page_model.dart';
import 'package:bloc_study/network/Api_client/api_client.dart';

class ProductPageRepository {
  Future fetchProductItems() async {
    final response = await ApiClient().get("/products");
    if (response.statusCode == 200) {
      List<ProductPageModel> productList = [];
      response.data.forEach((element) {
        productList.add(ProductPageModel.fromJson(element));
      });
      return productList;
    } else {
      throw Exception('Failed to products');
    }
  }
}
