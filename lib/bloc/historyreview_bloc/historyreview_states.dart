import 'package:equatable/equatable.dart';

abstract class HistoryReviewState extends Equatable {
  const HistoryReviewState();

  @override
  List<Object?> get props => [];
}
class HistoryReviewInitial extends HistoryReviewState {}
class HistoryReviewLoading extends HistoryReviewState {}
class HistoryReviewLoaded extends HistoryReviewState {
  final history;

  HistoryReviewLoaded(this.history);

// @override
// List<Object?> get props => [mList];
}
class HistoryReviewError extends HistoryReviewState {
  final String message;
  const HistoryReviewError(this.message);
}