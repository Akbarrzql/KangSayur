import 'package:equatable/equatable.dart';

abstract class AlamatState extends Equatable {
  const AlamatState();

  @override
  List<Object?> get props => [];
}
class AlamatInitial extends AlamatState {}
class AlamatLoading extends AlamatState {}
class AlamatLoaded extends AlamatState {
  final alamat;

  AlamatLoaded(this.alamat);

// @override
// List<Object?> get props => [mList];
}
class AlamatError extends AlamatState {
  final String message;
  const AlamatError(this.message);
}