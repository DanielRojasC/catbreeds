import 'package:catbreeds/app/utils/constants/path_constants.dart';
import 'package:catbreeds/app/utils/constants/styles.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth(context),
      height: deviceHeight(context),
      color: Colors.white,
      child: Center(
        child: Image(
          image: AssetImage(
            PathConstants.loading,
          ),
        ),
      ),
    );
  }
}
