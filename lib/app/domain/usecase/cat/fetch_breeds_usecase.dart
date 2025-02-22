import 'package:catbreeds/app/domain/entities/breed_entity.dart';
import 'package:catbreeds/app/domain/repositories/breed_repository.dart';
import 'package:catbreeds/app/domain/usecase/usecase.dart';

class FetchBreedsUsecase implements UseCase<List<BreedEntity>, void> {
  final BreedRepository catRepository;

  FetchBreedsUsecase({required this.catRepository});
  @override
  Future<List<BreedEntity>> call(void params) async =>
      await catRepository.fetchCats();
}
