import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/data/repository_impl/photo_repository_impl.dart';
import 'package:photo_gallery/app/data/source/photo/photo_api_impl.dart';
import 'package:photo_gallery/app/domain/usecase/get_all_photos.dart';
import 'package:photo_gallery/app/presentation/blocs/home/home_bloc.dart';
import 'package:photo_gallery/app/presentation/views/home/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        GetAllPhotos(repository: PhotoRepositoryImpl(api: PhotoApiImpl())),
      )..add(FetchPhotosEvent()),
      child: const HomeView(),
    );
  }
}
