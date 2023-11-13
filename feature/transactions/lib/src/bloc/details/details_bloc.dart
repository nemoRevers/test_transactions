import 'package:bloc/bloc.dart';
import 'package:domain/usecases/cancel_transaction_usecase.dart';
import 'package:equatable/equatable.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final CancelTransactionUseCase _cancelTransactionUseCase;

  DetailsBloc(CancelTransactionUseCase cancelTransactionUseCase)
      : _cancelTransactionUseCase = cancelTransactionUseCase,
        super(const DetailsState()) {
    on<CancelEvent>((CancelEvent event, Emitter<DetailsState> emit) {
      _cancelTransactionUseCase.execute(event.id);
    });
  }
}
