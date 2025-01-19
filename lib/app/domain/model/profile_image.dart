import 'package:equatable/equatable.dart';

class ProfileImage extends Equatable {
  String small;

  ProfileImage({
    required this.small,
  });

  @override
  List<Object?> get props => [small];
}