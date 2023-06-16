import 'package:kangsayur/model/checkoutmodel.dart';
import 'package:kangsayur/model/detailproductmodel.dart';
import 'package:kangsayur/model/nearesttokomodel.dart';
import 'package:kangsayur/model/productmostpopularmodel.dart';
import 'package:kangsayur/model/productusermostvisitmodel.dart';
import 'package:kangsayur/model/tokopopularmodel.dart';

import '../../model/cartproductmodel.dart';
import '../../model/profilemodel.dart';
import '../../model/searchproductmodel.dart';
import 'api_provider.dart';

class ApiRepository {
  final _apiProvider = ApiProvider();

  Future<ProfileModel> getProfileList() async {
    return await _apiProvider.ProfileModelList();
  }

  Future<ProductMostPopularModel> getProductMostPopularList() async {
    return await _apiProvider.ProductMostPopularModelList();
  }

  Future<ProductUserMostVisitModel> getProductUserMostVisitList() async {
    return await _apiProvider.ProductUserMostVisitModelList();
  }

  Future<NearestTokoModel> getNearestTokoList() async {
    return await _apiProvider.NearestTokoModelList();
  }

  Future<DetailProductModel> getDetailProductList(int id) async {
    return await _apiProvider.DetailProductModelList(id);
  }

  Future<SearchProductModel> getSearchProductList(String keyword) async {
    return await _apiProvider.SearchProductModelList(keyword);
  }

  Future<TokoPopularModel> getTokoPopularList() async {
    return await _apiProvider.TokoPopularModelList();
  }
  Future<CartProductModel> getCartProductList() async {
    return await _apiProvider.CartProductModelList();
  }
  Future<CheckoutModel> getCheckoutList() async {
    return await _apiProvider.CheckoutModelList();
  }
}

class NetworkError extends Error {
  final String message;
  NetworkError(this.message);
}
