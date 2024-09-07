enum FirestorePath {
  recipes,
  favorites,
  ;

  String path(String uid) => switch (this) {
        FirestorePath.recipes => 'users/$uid/recipes',
        FirestorePath.favorites => 'users/$uid/favorites',
      };
}
