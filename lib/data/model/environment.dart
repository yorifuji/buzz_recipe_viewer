import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment {
  algoliaApplicationId('ALGOLIA_APPLICATION_ID'),
  algoliaSearchOnlyApiKey('ALGOLIA_SEARCH_ONLY_API_KEY'),
  ;

  const Environment(this._key);
  final String _key;

  String get value => dotenv.env[_key] ?? '';
}
