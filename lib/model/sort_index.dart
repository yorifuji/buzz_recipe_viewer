enum SortIndex {
  timestamp('recipe_timestamp_desc'),
  likes('recipe_likes_desc'),
  views('recipe_views_desc');

  const SortIndex(this.indexName);
  final String indexName;
}
