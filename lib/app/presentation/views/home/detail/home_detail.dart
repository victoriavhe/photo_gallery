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
  final _imageRowCount = 6;
  final _scrollController = ScrollController();
  final _gridKey = GlobalKey();

  HomeBloc get _homeBloc => context.read<HomeBloc>();

  bool get _isHomeLoaded => _homeBloc.state.status == HomeStatus.loaded;

  bool get _isFirstPages => _homeBloc.state.currentPage <= _imageRowCount-1;

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
            return !hasReachEnd ? AppShimmer() : const Spacer();
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

  bool get _listNotCoveredScreen {
    final keyContext = _gridKey.currentContext;
    final height = MediaQuery.of(context).size.height;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      return (box.size.height < height);
    }
    return false;
  }

  bool get _hasReachedEnd {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentPosition = _scrollController.position.pixels;
    return currentPosition == maxScroll;
  }

  /// This functions will be called if a list has not covered an entire screen
  /// So that it will continue fetching the list.
  /// Once the screen has been covered by a list and [_listNotCoveredScreen]
  /// returns false, this function will not be called.
  ///
  /// The default [_onScroll] will activate the pagination by calling other
  /// pages.
  ///
  /// Need more adjustment to be more dynamic
  void _onGetInitialList() {
    bool shouldLoad = (_listNotCoveredScreen && _isHomeLoaded && _isFirstPages);
    if (!shouldLoad) return;
    _homeBloc.add(FetchPhotosEvent());
  }
}
