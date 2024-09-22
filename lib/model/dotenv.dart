import 'package:flutter_dotenv/flutter_dotenv.dart';

enum DotenvKey {
  algoliaApplicationId('ALGOLIA_APPLICATION_ID'),
  algoliaSearchOnlyApiKey('ALGOLIA_SEARCH_ONLY_API_KEY'),
  ;

  const DotenvKey(this.key);
  final String key;

  String get value => dotenv.env[key] ?? '';
}
