// import 'package:equatable/equatable.dart';
//
// class CatatanState extends Equatable {
//   CatatanState({
//     this.catatanList = const [],
//   })  :
//
//   final List<String> catatanList;
//
//   CatatanState copyWith({
//     DateTime? date,
//     DateTime? focusedDay,
//     DateTime? selectedDay,
//     int? totalPages,
//     int? currentPage,
//     int? limit,
//   }) {
//     return CatatanState(
//       date: date ?? this.date,
//       focusedDay: focusedDay ?? this.focusedDay,
//       selectedDay: selectedDay ?? this.selectedDay,
//       totalPages: totalPages ?? this.totalPages,
//       currentPage: currentPage ?? this.currentPage,
//       limit: limit ?? this.limit,
//     );
//   }
//
//   @override
//   List<Object?> get props =>
//       [date, focusedDay, selectedDay, limit, totalPages, currentPage];
// }