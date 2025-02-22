import 'package:bloc/bloc.dart';
import 'package:catbreeds/app/domain/entities/breed_entity.dart';
import 'package:catbreeds/app/domain/repositories/breed_repository.dart';
import 'package:catbreeds/app/domain/usecase/cat/fetch_breeds_usecase.dart';
import 'package:meta/meta.dart';

part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final BreedRepository catRepository;
  BreedBloc({required this.catRepository}) : super(BreedInitialState()) {
    on<FetchBreedsEvent>((_, emit) async => await _fetchBreeds(emit));
    on<FilterBreedsListEvent>(
      (event, emit) async => await _filterBreedsList(event, emit),
    );
    on<BreedInitialEvent>((_, emit) => emit(BreedInitialState()));
  }

  Future<void> _fetchBreeds(Emitter<BreedState> emit) async {
    emit(BreedLoadingState());

    try {
      final useCase = FetchBreedsUsecase(catRepository: catRepository);

      final cats = await useCase.call(null);

      emit(BreedFetchedState(cats: cats));
    } catch (e) {
      emit(BreedErrorState(message: e.toString()));
    }
  }

  Future<void> _filterBreedsList(
    FilterBreedsListEvent event,
    Emitter<BreedState> emit,
  ) async {
    final filteredList = event.breedsList
        .where((breed) =>
            breed.name.toLowerCase().startsWith(event.searchText.toLowerCase()))
        .toList();
    emit(BreedListFilteredState(breedsFilteredList: filteredList));
  }
}
