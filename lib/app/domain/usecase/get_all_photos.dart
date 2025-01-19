import 'package:either_dart/either.dart';
import 'package:photo_gallery/app/domain/model/photo.dart';
import 'package:photo_gallery/app/domain/repository/photo_repository.dart';
import 'package:photo_gallery/app/utils/error/failure.dart';

class GetAllPhotos {
  GetAllPhotos({required PhotoRepository repository})
      : _repository = repository;

  final PhotoRepository _repository;

  /// This enables us to retrieve either expected object on successful API Fetch
  /// OR error that is encapsulated on [Failure] object
  /// Enables us to use both properties to provide relevant information to user.
  Future<Either<Failure, List<Photo>>> call(int page) async =>
      await _repository.getAllPhotos(page);
}
