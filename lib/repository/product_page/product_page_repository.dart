import 'dart:io';

import 'package:bloc_study/model/product_page/product_page_model.dart';
import 'package:bloc_study/network/Api_client/api_client.dart';
import 'package:bloc_study/network/result.dart';

class ProductPageRepository {
  Future<Result<List<ProductPageModel>>> fetchProductItems() async {
    try {
      final response = await ApiClient().get("/products");
      if (response.statusCode == 200) {
        List<ProductPageModel> productList = [];
        response.data.forEach((element) {
          productList.add(ProductPageModel.fromJson(element));
        });
        return Result.ok(productList);
      } else {
        return Result.error(HttpException('Invalid response'));
      }
    } on Exception catch (exception){
      return Result.error(exception);
    }
  }
}
