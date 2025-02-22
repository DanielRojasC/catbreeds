part of 'breed_bloc.dart';

@immutable
sealed class BreedState {}

final class BreedInitialState extends BreedState {}

final class BreedLoadingState extends BreedState {}

final class BreedErrorState extends BreedState {
  final String message;

  BreedErrorState({required this.message});
}

final class BreedFetchedState extends BreedState {
  final List<BreedEntity> cats;

  BreedFetchedState({required this.cats});
}

final class BreedListFilteredState extends BreedState {
  final List<BreedEntity> breedsFilteredList;

  BreedListFilteredState({required this.breedsFilteredList});
}
