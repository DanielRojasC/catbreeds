import 'package:catbreeds/app/domain/entities/breed_entity.dart';
import 'package:catbreeds/app/widgets/breed/breed_list_item_widget.dart';
import 'package:flutter/material.dart';

class BreedListWidget extends StatelessWidget {
  final List<BreedEntity> breedList;
  const BreedListWidget({required this.breedList, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: breedList.length,
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
      itemBuilder: (context, index) {
        return BreedListItemWidget(breed: breedList[index]);
      },
    );
  }
}
