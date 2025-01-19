import 'package:either_dart/either.dart';
import 'package:photo_gallery/app/domain/model/photo.dart';
import 'package:photo_gallery/app/utils/error/failure.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<Photo>>> getAllPhotos(int page);
}