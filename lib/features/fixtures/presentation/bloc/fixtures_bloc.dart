import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fixtures_event.dart';
part 'fixtures_state.dart';

class FixturesBloc extends Bloc<FixturesEvent, FixturesState> {
  FixturesBloc() : super(FixturesInitial()) {
    on<FixturesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
