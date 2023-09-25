import 'package:kangsayur/bloc/kategori_bloc/kategori_bloc.dart';
import 'package:kangsayur/model/chatlistmodel.dart';
import 'package:kangsayur/model/checkoutmodel.dart';
import 'package:kangsayur/model/detailproductmodel.dart';
import 'package:kangsayur/model/historyreviewmodel.dart';
import 'package:kangsayur/model/iklanhomemodel.dart';
import 'package:kangsayur/model/iklanmodel.dart';
import 'package:kangsayur/model/kategorimodel.dart';
import 'package:kangsayur/model/menunggudiulasmodel.dart';
import 'package:kangsayur/model/nearesttokomodel.dart';
import 'package:kangsayur/model/notifikasilistmodel.dart';
import 'package:kangsayur/model/productbycategorymodel.dart';
import 'package:kangsayur/model/productmostpopularmodel.dart';
import 'package:kangsayur/model/productusermostvisitmodel.dart';
import 'package:kangsayur/model/roomchatmodel.dart';
import 'package:kangsayur/model/statuspesanandiantarmodel.dart';
import 'package:kangsayur/model/statuspesanandisiapkanmodel.dart';
import 'package:kangsayur/model/statuspesananselesaiselesai.dart';
import 'package:kangsayur/model/subtotalcartmodel.dart';
import 'package:kangsayur/model/tokopopularmodel.dart';
import 'package:kangsayur/model/tokoproductcategorymodel.dart';

import '../../model/alamatmodel.dart';
import '../../model/cartproductmodel.dart';
import '../../model/checkoutbuymodel.dart';
import '../../model/productsalemodel.dart';
import '../../model/produkterlarismodel.dart';
import '../../model/profilemodel.dart';
import '../../model/searchproductmodel.dart';
import '../../model/statuspesanandikemas.dart';
import '../../model/tokodetailmodel.dart';
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

  Future<CheckoutModel> getCheckoutList(int alamatId) async {
    return await _apiProvider.CheckoutModelList(alamatId);
  }

  Future<StatusPesananDikemasModel> getStatusPesananKonfirmasiList() async {
    return await _apiProvider.StatusPesananKonfirmasiList();
  }

  Future<StatusPesananDisiapkan> getStatusPesananDisiapkanList() async {
    return await _apiProvider.StatusPesananDisiapkanList();
  }

  Future<StatusPesananDiantarModel> getStatusPesananDiantarList() async {
    return await _apiProvider.StatusPesananDiantarList();
  }

  Future<StatusPesananSelesaiModel> getStatusPesananSelesaiList() async {
    return await _apiProvider.StatusPesananSelesaiList();
  }

  Future<TokoDetailModel> getTokoDetailList(String id) async {
    return await _apiProvider.TokoDetailList(id);
  }

  Future<SubTotalCartModel> getSubTotalList() async {
    return await _apiProvider.SubTotalCartList();
  }

  Future<IklanModel> getIklanList() async {
    return await _apiProvider.IklanList();
  }

  Future<MenungguDiulasModel> getMenungguDiulasList() async {
    return await _apiProvider.Menunggu_diulas();
  }

  Future<AlamatModel> getAlamatList() async {
    return await _apiProvider.Alamat();
  }

  Future<CheckoutBuyModel> postCheckoutBuy(int alamatId, int tokoId,
      int produkId, int variantId, int jumlahBeli) async {
    return await _apiProvider.CheckoutBuy(
        alamatId, tokoId, produkId, variantId, jumlahBeli);
  }

  Future<ProductSaleModel> getProductSaleList() async {
    return await _apiProvider.ProductSale();
  }

  Future<HistoryReviewModel> getHistoryReviewList() async {
    return await _apiProvider.HistoryReview();
  }

  Future<KategoriModel> getKategoriList() async {
    return await _apiProvider.Kategori();
  }

  Future<ProdukTerlarisModel> getProdukTerlarisList() async {
    return await _apiProvider.ProdukTerlaris();
  }

  Future<IklanHomeModel> getIklanHomeList() async {
    return await _apiProvider.IklanHome();
  }
  Future<ProductByCategoryModel> getProductByCategoryList(String kategoriId) async {
    return await _apiProvider.ProductByCategory(kategoriId);
  }
  Future<ChatListModel> getChatListList() async {
    return await _apiProvider.ChatList();
  }
  Future<RoomChatModel> getRoomChatList(String conversationId) async {
    return await _apiProvider.RoomChat(conversationId);
  }
  Future<TokoProductCategoryModel> getTokoProductCategoryList(String kategoriId, String tokoId) async {
    return await _apiProvider.TokoProductCategory(kategoriId, tokoId);
  }
  Future<NotifikasiListModel> getNotifikasiListList() async {
    return await _apiProvider.NotifikasiList();
  }



}

class NetworkError extends Error {
  final String message;

  NetworkError(this.message);
}
