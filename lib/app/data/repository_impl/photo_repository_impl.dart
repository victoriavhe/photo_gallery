
import 'package:either_dart/either.dart';
import 'package:photo_gallery/app/data/dto/photo_dto.dart';
import 'package:photo_gallery/app/data/source/photo/photo_api.dart';
import 'package:photo_gallery/app/domain/repository/photo_repository.dart';
import 'package:photo_gallery/app/utils/error/failure.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApi _api;

  PhotoRepositoryImpl({
    required PhotoApi api,
  }) : _api = api;

  @override
  Future<Either<Failure, List<PhotoDto>>> getAllPhotos(int page) async {
    final photoList = await _api.getAllPhotos(page);
    return photoList;
  }
}
