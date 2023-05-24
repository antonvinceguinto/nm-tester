import 'package:equatable/equatable.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class JobsFetchEvent extends JobsEvent {
  const JobsFetchEvent({
    this.filterData = const {},
    this.search = '',
    this.take = 20,
    this.skip = 0,
  });

  final Map<String, dynamic> filterData;
  final String search;
  final int take;
  final int skip;
}

class SelectAllJobsEvent extends JobsEvent {
  const SelectAllJobsEvent({
    required this.qfc,
  });

  final QuotesFiltersCubit qfc;
}
