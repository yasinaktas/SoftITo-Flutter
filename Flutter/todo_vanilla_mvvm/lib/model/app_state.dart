class AppState<T> {
  final T info;
  final bool isLoading;
  final String? errorMessage;

  AppState({required this.info, this.isLoading = false, this.errorMessage});

  AppState<T> copyWith({T? info, bool? isLoading, String? errorMessage}) {
    return AppState(
      info: info ?? this.info,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
