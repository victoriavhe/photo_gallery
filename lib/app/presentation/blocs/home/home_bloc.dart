import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/domain/model/photo.dart';
import 'package:photo_gallery/app/domain/usecase/get_all_photos.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomePageState> {
  HomeBloc(this._getAllPhotos) : super(const HomePageState()) {
    on<FetchPhotosEvent>(_onFetchPhotos);
  }

  final GetAllPhotos _getAllPhotos;

  Future<void> _onFetchPhotos(event, Emitter<HomePageState> emit) async {
    if (state.hasReachedMax) return;
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await _getAllPhotos(state.currentPage);

    /// checking if result is left (fail) or right (succeed)
    if (result.isLeft) {
      emit(state.copyWith(
        status: HomeStatus.error,
        error: result.left.error,
      ));
    } else {
      final list = result.right;
      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          photos: List.of(state.photos)..addAll(list),
          hasReachedMax: list.isEmpty,
          currentPage: state.currentPage + 1,
        ),
      );
    }
  }
}
