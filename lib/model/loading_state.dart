enum LoadingState {
  loadable,
  loading,
  success,
  failure;

  bool get isLoadable => this == LoadingState.loadable;
  bool get isLoading => this == LoadingState.loading;
  bool get isSuccess => this == LoadingState.success;
  bool get isFailure => this == LoadingState.failure;
}
