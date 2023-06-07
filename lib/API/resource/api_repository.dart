
import 'package:kangsayur/model/detailproductmodel.dart';
import 'package:kangsayur/model/nearesttokomodel.dart';
import 'package:kangsayur/model/productmostpopularmodel.dart';
import 'package:kangsayur/model/productusermostvisitmodel.dart';

import '../../model/profilemodel.dart';
import 'api_provider.dart';

class ApiRepository {
  final  _apiProvider = ApiProvider();

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
    return await _apiProvider.DetailProductModelList(
      id
    );
  }




}
class NetworkError extends Error {}