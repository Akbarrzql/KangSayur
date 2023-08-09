import 'package:equatable/equatable.dart';

abstract class MenungguDiulasState extends Equatable {
  const MenungguDiulasState();

  @override
  List<Object?> get props => [];
}
class MenungguDiulasInitial extends MenungguDiulasState {}
class MenungguDiulasLoading extends MenungguDiulasState {}
class MenungguDiulasLoaded extends MenungguDiulasState {
  final menungguDiulas;

  MenungguDiulasLoaded(this.menungguDiulas);

// @override
// List<Object?> get props => [mList];
}
class MenungguDiulasError extends MenungguDiulasState {
  final String message;
  const MenungguDiulasError(this.message);
}