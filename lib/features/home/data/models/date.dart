import 'package:equatable/equatable.dart';

class DateModel extends Equatable {
  final int day;
  final int month;
  final int year;

  DateModel({
    required DateTime date
  }):day = date.day,
  month = date.month,
  year = date.year ;

  @override
  List<Object?> get props => [day,month,year];
}