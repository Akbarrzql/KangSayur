import 'package:equatable/equatable.dart';
abstract class HistoryReviewEvent extends Equatable {
  const HistoryReviewEvent();

  @override
  List<Object> get props => [];
}

class GetHistoryReviewList extends HistoryReviewEvent{}
