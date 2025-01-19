import 'package:either_dart/either.dart';
import 'package:photo_gallery/app/data/dto/photo_dto.dart';
import 'package:http/http.dart' as http;
import 'package:photo_gallery/app/data/source/photo/photo_api.dart';
import 'package:photo_gallery/app/utils/constants.dart';
import 'package:photo_gallery/app/utils/data/get_access_key.dart';
import 'package:photo_gallery/app/utils/error/failure.dart';
import 'package:photo_gallery/app/utils/string_extension.dart';

class PhotoApiImpl extends PhotoApi {
  String? get accessKey => getAccessKey();

  @override
  Future<Either<Failure, List<PhotoDto>>> getAllPhotos(int page) async {
    if (accessKey.isNullOrEmpty) {
      return Left(GeneralFailures(error: 'Unable to get the key'));
    }

    final fetchPhotoUrl = '${Constants.baseUrl}/photos'
        '?client_id=$accessKey&page=$page';

    try {
      final http.Response response = await http.get(Uri.parse(fetchPhotoUrl));
      if (response.statusCode == 200) {
        final list = photoDtoFromJson(response.body);
        return Right(list);
      } else {
        if (response.statusCode == 403) {
          return Left(GeneralFailures(error: response.body));
        }
        return Left(GeneralFailures());
      }
    } on Exception catch (e) {
      return Left(GeneralFailures());
    }
  }
}
