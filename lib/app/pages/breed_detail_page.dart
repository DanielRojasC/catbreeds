import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/app/domain/entities/breed_entity.dart';
import 'package:catbreeds/app/utils/constants/styles.dart';
import 'package:catbreeds/app/widgets/breed/breed_detail_features_item_widget.dart';
import 'package:catbreeds/app/widgets/loading_widget.dart';
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
            Card(
              elevation: 5,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: SizedBox(
                width: deviceWidth(context),
                child: Hero(
                  tag: breed.id,
                  child: CachedNetworkImage(
                    imageUrl: breed.image.url,
                    placeholder: (context, url) => LoadingWidget(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                          title: "Lifespan",
                          content: "${breed.lifeSpan} years",
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
