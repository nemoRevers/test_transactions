part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class CancelEvent extends DetailsEvent {
  final int id;

  const CancelEvent(this.id);

  @override
  List<Object?> get props => <Object?>[id];
}
