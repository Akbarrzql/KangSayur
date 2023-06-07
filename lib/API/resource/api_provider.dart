import 'package:http/http.dart' as http;
import 'package:kangsayur/model/detailproductmodel.dart';
import 'package:kangsayur/model/nearesttokomodel.dart';
import 'package:kangsayur/model/productusermostvisitmodel.dart';
import 'package:kangsayur/model/profilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/productmostpopularmodel.dart';
class ApiProvider{
  final String _url = 'https://kangsayur.nitipaja.online/api';

  Future<ProfileModel> ProfileModelList() async{
    //call token
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    try{
      var response = await http.get(Uri.parse(_url+'/user/profile'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return profileModelFromJson(response.body);
    }catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }
  Future<ProductMostPopularModel> ProductMostPopularModelList() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini token
    print('dibawah ini token');
    print(token);
    try{
      var response = await http.get(Uri.parse(_url+'/user/produk/populer'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return productMostPopularModelFromJson(response.body);
    }catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }
  Future<ProductUserMostVisitModel> ProductUserMostVisitModelList() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini token
    print('dibawah ini token');
    print(token);
    try{
      var response = await http.get(Uri.parse(_url+'/user/produk/sering/user/kunjungi'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return productUserMostVisitModelFromJson(response.body);
    }catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }
  Future<NearestTokoModel> NearestTokoModelList() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini token
    print('dibawah ini token');
    print(token);
    try{
      var response = await http.get(Uri.parse(_url+'/user/toko/terderkat'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return nearestTokoModelFromJson(response.body);
    }catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }
  Future<DetailProductModel> DetailProductModelList(int id) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini token
    print('dibawah ini token');
    print(token);
    print(id);
    try{
      var response = await http.get(Uri.parse(_url+'/user/produk/detail?produkId=$id'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return detailProductModelFromJson(response.body);
    }catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

}