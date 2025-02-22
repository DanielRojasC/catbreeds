part of 'breed_bloc.dart';

@immutable
sealed class BreedEvent {}

final class BreedInitialEvent extends BreedEvent {}

final class FetchBreedsEvent extends BreedEvent {}

final class FilterBreedsListEvent extends BreedEvent {
  final String searchText;
  final List<BreedEntity> breedsList;

  FilterBreedsListEvent({required this.searchText, required this.breedsList});
}
