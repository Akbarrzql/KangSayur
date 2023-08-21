import 'package:equatable/equatable.dart';

abstract class KategoriState extends Equatable {
  const KategoriState();

  @override
  List<Object?> get props => [];
}
class KategoriInitial extends KategoriState {}
class KategoriLoading extends KategoriState {}
class KategoriLoaded extends KategoriState {
  final Kategori;

  KategoriLoaded(this.Kategori);

// @override
// List<Object?> get props => [mList];
}
class KategoriError extends KategoriState {
  final String message;
  const KategoriError(this.message);
}