import 'package:catbreeds/app/app.dart';
import 'package:catbreeds/app/utils/constants/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  Future.value(WidgetsFlutterBinding.ensureInitialized());

  await dotenv.load(fileName: PathConstants.environmentPath);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const CatBreedsApp());
}
