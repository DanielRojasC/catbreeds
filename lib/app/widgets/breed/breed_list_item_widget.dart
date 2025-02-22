import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/app/domain/entities/breed_entity.dart';
import 'package:catbreeds/app/pages/breed_detail_page.dart';
import 'package:catbreeds/app/utils/constants/path_constants.dart';
import 'package:catbreeds/app/utils/constants/styles.dart';
import 'package:catbreeds/app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class BreedListItemWidget extends StatelessWidget {
  final BreedEntity breed;
  const BreedListItemWidget({required this.breed, super.key});

  @override
  Widget build(BuildContext context) {
    void _onClickItem(BreedEntity breed) => Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => BreedDetailPage(breed: breed)));

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: deviceWidth(context) * 0.8,
          height: deviceHeight(context) * 0.4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    breed.name,
                    style: Styles.basicTextStyle(18),
                  ),
                  MaterialButton(
                    color: Styles.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    onPressed: () => _onClickItem(breed),
                    child: const Text("Details"),
                  ),
                ],
              ),
              Expanded(
                child: Hero(
                  tag: breed.id,
                  child: breed.image.url.isEmpty
                      ? Center(child: Text("Photo not found"))
                      : CachedNetworkImage(
                          imageUrl: breed.image.url,
                          placeholder: (context, url) => LoadingWidget(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      breed.origin,
                      style: Styles.basicTextStyle(18),
                    ),
                    Text(
                      "Inteligence: ${breed.intelligence.toString()}",
                      style: Styles.basicTextStyle(18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
