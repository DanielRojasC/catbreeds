import 'dart:convert';

import 'package:catbreeds/app/domain/entities/breed_entity.dart';

final class BreedMapper {
  BreedMapper();
}

extension $CatMapper on BreedMapper {
  List<BreedEntity> fromJsonList(body) {
    List<BreedEntity> catList = [];

    final jsonList = jsonDecode(body);

    for (Map<String, dynamic> cat in jsonList) {
      catList.add(BreedEntity.fromJson(cat));
    }

    return catList;
  }
}
