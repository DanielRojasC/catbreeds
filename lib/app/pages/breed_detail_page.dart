import 'package:catbreeds/app/domain/entities/breed_entity.dart';
import 'package:catbreeds/app/utils/constants/styles.dart';
import 'package:catbreeds/app/widgets/breed/breed_detail_features_item_widget.dart';
import 'package:flutter/material.dart';

class BreedDetailPage extends StatelessWidget {
  final BreedEntity breed;
  const BreedDetailPage({required this.breed, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.secondaryColor,
        shadowColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: Text(
          breed.name,
          style: Styles.basicTextStyle(20),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: deviceHeight(context) * 0.4,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                width: deviceWidth(context),
                child: Hero(
                  tag: breed.id,
                  child: Image(
                    image: NetworkImage(breed.image.url),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: deviceWidth(context) * 0.9,
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        breed.description,
                        style: Styles.basicTextStyle(
                          16,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Divider(),
                      BreedDetailItemWidget(
                        title: "Temperament",
                        content: breed.temperament,
                      ),
                      BreedDetailItemWidget(
                        title: "Origin",
                        content: breed.origin,
                      ),
                      BreedDetailItemWidget(
                        title: "Inteligence",
                        content: breed.intelligence.toString(),
                      ),
                      BreedDetailItemWidget(
                        title: "Adaptability",
                        content: breed.adaptability.toString(),
                      ),
                      BreedDetailItemWidget(
                        title: "Dog Friendly",
                        content: breed.dogFriendly.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
