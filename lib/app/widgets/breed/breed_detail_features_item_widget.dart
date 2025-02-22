import 'package:catbreeds/app/utils/constants/styles.dart';
import 'package:flutter/material.dart';

class BreedDetailItemWidget extends StatelessWidget {
  final String title, content;
  const BreedDetailItemWidget({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$title: ",
                style: Styles.basicTextStyle(
                  16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Flexible(
                child: Text(
                  content,
                  style: Styles.basicTextStyle(
                    16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
