part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomePageState extends Equatable {
  final HomeStatus status;
  final List<Photo> photos;
  final bool hasReachedMax;
  final int currentPage;
  final String? error;

  const HomePageState({
    this.status = HomeStatus.initial,
    this.photos = const [],
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.error,
  });

  HomePageState copyWith({
    HomeStatus? status,
    List<Photo>? photos,
    bool? hasReachedMax,
    int? currentPage,
    String? error,
  }) {
    return HomePageState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, photos, hasReachedMax, currentPage];
}
