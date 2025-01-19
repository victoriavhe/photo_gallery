import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/domain/model/photo.dart';
import 'package:photo_gallery/app/presentation/blocs/home/home_bloc.dart';
import 'package:photo_gallery/app/presentation/views/home/detail/photo_detail_page.dart';
import 'package:photo_gallery/app/presentation/views/widget/app_shimmer.dart';
import 'package:photo_gallery/app/presentation/views/widget/photo_item.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({super.key});

  @override
  State<HomeDetail> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeDetail> {
  /// Change this value to change thumbnails horizontal count.
  final _imageRowCount = 3;
  final _scrollController = ScrollController();
  final _gridKey = GlobalKey();
  final _shimmerKey = GlobalKey();

  HomeBloc get _homeBloc => context.read<HomeBloc>();

  bool get _isHomeLoaded => _homeBloc.state.status == HomeStatus.loaded;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final list = context.select((HomeBloc b) => b.state.photos);
    final hasReachEnd = context.select((HomeBloc b) => b.state.hasReachedMax);

    /// Enable [PhotoItem] to change its size dynamically
    /// based on the axis count
    final photoSize = width / _imageRowCount;

    /// Fetching more list if the list has not covered entire screen yet
    _onGetInitialList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Photo Gallery')),
      body: GridView.builder(
        key: _gridKey,
        gridDelegate: _gridDelegate(width, photoSize),
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: hasReachEnd ? list.length : list.length + 1,
        itemBuilder: (context, int i) {
          if (i >= list.length) {
            return !hasReachEnd ? AppShimmer(
              key: _shimmerKey,
            ) : const Spacer();
          }
          final e = list[i];
          return PhotoItem(
            photo: e,
            photoSize: photoSize,
            onItemTapped: _goToDetailPage,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  _gridDelegate(width, photoSize) {
    final axisCount = (width ~/ photoSize).toInt();
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: axisCount,
    );
  }

  _goToDetailPage(Photo p) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoDetailPage(photo: p),
      ),
    );
  }

  void _onScroll() {
    if (_hasReachedEnd) _homeBloc.add(FetchPhotosEvent());
  }

  bool get _isListCoveredScreen {
    final keyContext = _gridKey.currentContext;
    final shimmerCtx = _shimmerKey.currentContext;
    final height = MediaQuery.of(context).size.height*.8;
    final heightY = MediaQuery.of(context).size.height*.85;
    final width = MediaQuery.of(context).size.width *.8;

    if (keyContext != null) {
      double posX = MediaQuery.of(context).size.width;
      double posY = MediaQuery.of(context).size.height;
      final box = keyContext.findRenderObject() as RenderBox;
      late final RenderBox shimmerBox;

      if (shimmerCtx != null) {
        shimmerBox = shimmerCtx.findRenderObject() as RenderBox;
        posX = shimmerBox.localToGlobal(Offset.zero).dx;
        posY = shimmerBox.localToGlobal(Offset.zero).dy;
      }
      return (box.size.height > height && (posY >= heightY || posX >= width));
    }
    return false;
  }

  bool get _hasReachedEnd {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentPosition = _scrollController.position.pixels;
    return currentPosition == maxScroll;
  }

  /// This functions will continue fetching the list if the list has not
  /// covered the screen's height.
  /// Once the screen has been covered by a list and [_isListCoveredScreen]
  /// returns true, this function will halt fetching photos.
  ///
  /// The default [_onScroll] will activate the pagination by calling other
  /// pages.
  void _onGetInitialList() {
    if (!_isHomeLoaded) return;

    if (_isListCoveredScreen) return;
    _homeBloc.add(FetchPhotosEvent());
  }
}
