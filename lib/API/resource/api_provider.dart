import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/menunggu_diulas.dart';
import 'package:kangsayur/model/cartproductmodel.dart';
import 'package:kangsayur/model/chatlistmodel.dart';
import 'package:kangsayur/model/checkoutbuymodel.dart';
import 'package:kangsayur/model/checkoutmodel.dart';
import 'package:kangsayur/model/detailproductmodel.dart';
import 'package:kangsayur/model/historyreviewmodel.dart';
import 'package:kangsayur/model/iklanhomemodel.dart';
import 'package:kangsayur/model/iklanmodel.dart';
import 'package:kangsayur/model/menunggudiulasmodel.dart';
import 'package:kangsayur/model/nearesttokomodel.dart';
import 'package:kangsayur/model/productbycategorymodel.dart';
import 'package:kangsayur/model/productsalemodel.dart';
import 'package:kangsayur/model/productusermostvisitmodel.dart';
import 'package:kangsayur/model/produkterlarismodel.dart';
import 'package:kangsayur/model/profilemodel.dart';
import 'package:kangsayur/model/roomchatmodel.dart';
import 'package:kangsayur/model/searchproductmodel.dart';
import 'package:kangsayur/model/statuspesanandiantarmodel.dart';
import 'package:kangsayur/model/statuspesanandisiapkanmodel.dart';
import 'package:kangsayur/model/tokodetailmodel.dart';
import 'package:kangsayur/model/tokopopularmodel.dart';
import 'package:kangsayur/model/tokoproductcategorymodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/alamatmodel.dart';
import '../../model/kategorimodel.dart';
import '../../model/notifikasilistmodel.dart';
import '../../model/productmostpopularmodel.dart';
import '../../model/statuspesanandikemas.dart';
import '../../model/statuspesananselesaiselesai.dart';
import '../../model/subtotalcartmodel.dart';

class ApiProvider {
  final String _url = 'https://kangsayur.nitipaja.online/api';

  Future<ProfileModel> ProfileModelList() async {
    //call token
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/profile'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return profileModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<ProductMostPopularModel> ProductMostPopularModelList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini token
    print('dibawah ini token');
    print(token);
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/produk/populer'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return productMostPopularModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<ProductUserMostVisitModel> ProductUserMostVisitModelList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini token
    print('dibawah ini token');
    print(token);
    try {
      var response = await http
          .get(Uri.parse(_url + '/user/produk/sering/user/kunjungi'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return productUserMostVisitModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<NearestTokoModel> NearestTokoModelList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini token
    print('dibawah ini token');
    print(token);
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/toko/terderkat'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return nearestTokoModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<DetailProductModel> DetailProductModelList(int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini token
    print('dibawah ini token');
    print(token);
    print(id);
    try {
      var response = await http
          .get(Uri.parse(_url + '/user/produk/detail?produkId=$id'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return detailProductModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<SearchProductModel> SearchProductModelList(String keyword) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini tokensear
    print('dibawah ini token');
    print(token);
    print(keyword);
    try {
      var response = await http
          .get(Uri.parse(_url + '/user/produk/home/search/$keyword'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return searchProductModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<TokoPopularModel> TokoPopularModelList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    //print dibawah ini tokensear
    print('dibawah ini token');
    print(token);
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/toko/popular'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return tokoPopularModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<CartProductModel> CartProductModelList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/produk/cart'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return cartProductModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<CheckoutModel> CheckoutModelList(int alamatId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    if (alamatId == 0) {
      try {
        var response = await http
            .get(Uri.parse(_url + '/user/produk/cart/checkout'), headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
        print(response.body);
        return checkoutModelFromJson(response.body);
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        rethrow;
      }
    } else {
      try {
        var response = await http.get(
            Uri.parse(_url + '/user/produk/cart/checkout?alamatId=$alamatId'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            });
        print(response.body);
        return checkoutModelFromJson(response.body);
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        rethrow;
      }
    }
  }

  Future<StatusPesananDikemasModel> StatusPesananKonfirmasiList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/status/pesanan'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return statusPesananDikemasModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<StatusPesananDisiapkan> StatusPesananDisiapkanList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/status/disiapkan'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return statusPesananDisiapkanFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<StatusPesananDiantarModel> StatusPesananDiantarList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/status/diantar'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return statusPesananDiantarModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<StatusPesananSelesaiModel> StatusPesananSelesaiList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/status/selesai'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return statusPesananSelesaiModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<TokoDetailModel> TokoDetailList(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(id);
    try {
      var response = await http
          .get(Uri.parse(_url + '/user/toko/detail?tokoId=$id'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return tokoDetailModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<SubTotalCartModel> SubTotalCartList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response = await http
          .get(Uri.parse(_url + '/user/produk/cart/total/selected'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return subTotalCartModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<IklanModel> IklanList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/display-iklan'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return iklanModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<MenungguDiulasModel> Menunggu_diulas() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/menunggu-diulas'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return menungguDiulasModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<AlamatModel> Alamat() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/alamat/list'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return alamatModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  // post data
  Future<CheckoutBuyModel> CheckoutBuy(int alamatId, int tokoId, int produkId,
      int variantId, int jumlahBeli) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    final response = await http.post(
      Uri.parse(_url + '/user/produk/cart/instantbuy'),
      headers: {
        'Authorization': 'Bearer $token',
        // Ganti your_token_here dengan token Anda
      },
      body: {
        "tokoId": tokoId.toString(),
        "produkId": produkId.toString(),
        "variantid": variantId.toString(),
        "jumlahBeli": jumlahBeli.toString(),
        "alamatId": alamatId.toString(),
      },
    );
    //print tokoid
    print("tokoId $tokoId");
    print("produkId $produkId");
    print("jumlahBeli $jumlahBeli");
    print("variantId $variantId");
    print("alamatId $alamatId");

    if (response.statusCode == 200) {
      print(response.body);
      return checkoutBuyModelFromJson(response.body);
    } else {
      print(response.body);
      throw Exception('Failed to load data');
    }
  }

  Future<ProductSaleModel> ProductSale() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response = await http
          .get(Uri.parse(_url + '/user/produk/promo/kilat'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return productSaleModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<HistoryReviewModel> HistoryReview() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/riwayat-ulasan'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return historyReviewModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<KategoriModel> Kategori() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/kategori'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return kategoriModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<ProdukTerlarisModel> ProdukTerlaris() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/produk/terlaris'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return produkTerlarisModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<IklanHomeModel> IklanHome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/iklan-toko'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return iklanHomeModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<ProductByCategoryModel> ProductByCategory(String kategoriId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response = await http.get(
          Uri.parse(_url + '/user/produk/kategori?kategoriId=$kategoriId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      return productByCategoryModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<ChatListModel> ChatList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response =
          await http.get(Uri.parse(_url + '/user/chat/list'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      return chatListModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<RoomChatModel> RoomChat(String conversationId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response = await http.get(
          Uri.parse(_url + '/user/chat/room?conversationId=$conversationId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      return roomChatModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }

  Future<TokoProductCategoryModel> TokoProductCategory(
      String kategoriId, String tokoId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response = await http.get(
          Uri.parse(_url +
              '/user/toko/katalog/produkByCategoryId?kategoriId=$kategoriId&tokoId=$tokoId'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      return tokoProductCategoryModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }
  Future<NotifikasiListModel> NotifikasiList(
      ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    try {
      var response = await http.get(
          Uri.parse(_url +
              '/user/inbox/data-inbox'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      print(response.body);
      return notifikasiListModelFromJson(response.body);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }
}
