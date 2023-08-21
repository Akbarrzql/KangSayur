import 'package:equatable/equatable.dart';

abstract class BeliLangsungEvent extends Equatable {
  const BeliLangsungEvent();

  @override
  List<Object> get props => [];
}

class SendData extends BeliLangsungEvent {
  final int alamatId, tokoId, produkId, variantId, jumlahBeli;

  SendData(this.alamatId, this.tokoId, this.produkId, this.variantId, this.jumlahBeli);

}
