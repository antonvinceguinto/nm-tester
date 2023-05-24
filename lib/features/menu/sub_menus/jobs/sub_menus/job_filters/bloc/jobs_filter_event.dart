part of 'jobs_filter_bloc.dart';

abstract class JobsFilterEvent extends Equatable {
  const JobsFilterEvent();

  @override
  List<Object> get props => [];
}

class JobsFilterStatusFetch extends JobsFilterEvent {
  const JobsFilterStatusFetch();
}

class PriorityFetchEvent extends JobsFilterEvent {
  const PriorityFetchEvent();
}

class PricingFetchEvent extends JobsFilterEvent {
  const PricingFetchEvent();
}
