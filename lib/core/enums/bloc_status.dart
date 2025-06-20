enum BlocStatus {
  initial,
  loading,
  success,
  loadingMore,

  failure;

  bool get isInitial => this == BlocStatus.initial;

  bool get isLoading => this == BlocStatus.loading;

  bool get isSuccess => this == BlocStatus.success;

  bool get isLoadingMore => this == BlocStatus.loadingMore;

  bool get isFailure => this == BlocStatus.failure;
}
