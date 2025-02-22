import 'package:catbreeds/app/utils/environment.dart';

final class ConstantsData {
  static Duration requestTimeout = Duration(seconds: 30);

  static Map<String, String> headers = {
    'x-api-key': Environment.apiKey,
  };
}
