import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_app/core/error/failures.dart';
import 'package:football_app/core/error/messages.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';
import 'package:football_app/features/fixtures/domain/entities/statistics.dart';
import 'package:football_app/features/fixtures/domain/usecases/get_fixtures.dart';
import 'package:football_app/features/fixtures/domain/usecases/get_statistics.dart';

part 'fixtures_event.dart';
part 'fixtures_state.dart';

class FixturesBloc extends Bloc<FixturesEvent, FixturesState> {
  final GetFixturesUsecase getFixturesUsecase;
  final GetStatisticsUsecase getStatisticsUsecase;
  FixturesBloc({
    required this.getFixturesUsecase,
    required this.getStatisticsUsecase,
  }) : super(FixturesInitial()) {
    on<GetFixtures>((event, emit) async {
      emit(GetFixturesLoading());

      final failureOrFixtures = await getFixturesUsecase.call();
      emit(
        failureOrFixtures.fold(
          (l) => GetFixturesError(getFailureMessage(l)),
          (r) => GetFixturesLoaded(fixtures: r),
        ),
      );
    });
    on<GetStatistics>((event, emit) async {
      emit(GetStatisticsLoading());

      final failureOrStatGetStatistics =
          await getStatisticsUsecase.call(event.fixtureId);
      emit(
        failureOrStatGetStatistics.fold(
          (l) => GetStatisticsError(getFailureMessage(l)),
          (r) => GetStatisticsLoaded(statistics: r),
        ),
      );
    });
  }
}

String getFailureMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (ServerFailure):
      return ErrorMessages.kServerFailureMessage;
    case const (NetworkFailure):
      return ErrorMessages.kNetworkFailureMessage;
    default:
      return ErrorMessages.kServerFailureMessage;
  }
}
