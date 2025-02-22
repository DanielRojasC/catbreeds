import 'dart:io';

import 'package:catbreeds/app/data/mappers/breed_mapper.dart';
import 'package:catbreeds/app/data/utils/constants_data.dart';
import 'package:catbreeds/app/domain/entities/breed_entity.dart';
import 'package:catbreeds/app/domain/repositories/breed_repository.dart';
import 'package:catbreeds/app/utils/environment.dart';

import 'package:http/http.dart' as http;

final class BreedRepositoryImpl implements BreedRepository {
  final httpClient = http.Client();
  final url = "${Environment.baseUrl}/breeds";

  @override
  Future<List<BreedEntity>> fetchCats() async {
    final response = await httpClient
        .get(
          Uri.parse(url),
          headers: ConstantsData.headers,
        )
        .timeout(ConstantsData.requestTimeout);

    final statusCode = response.statusCode;

    if (statusCode == HttpStatus.ok) {
      final catList = BreedMapper().fromJsonList(response.body);

      return catList;
    }

    throw Exception("Failed to fetch cats");
  }
}
