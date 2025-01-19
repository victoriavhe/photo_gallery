import 'package:either_dart/either.dart';
import 'package:photo_gallery/app/data/dto/photo_dto.dart';
import 'package:photo_gallery/app/utils/error/failure.dart';

abstract class PhotoApi {
  //get all photos
  Future<Either<Failure, List<PhotoDto>>> getAllPhotos(int page);
}