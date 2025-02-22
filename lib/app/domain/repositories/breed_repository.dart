import 'package:catbreeds/app/domain/entities/breed_entity.dart';

abstract class BreedRepository {
  Future<List<BreedEntity>> fetchCats();
}
