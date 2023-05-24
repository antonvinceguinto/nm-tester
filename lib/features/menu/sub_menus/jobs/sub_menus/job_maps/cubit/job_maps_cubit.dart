import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'job_maps_state.dart';

class JobMapsCubit extends Cubit<JobMapsState> {
  JobMapsCubit() : super(JobMapsInitial());
}
