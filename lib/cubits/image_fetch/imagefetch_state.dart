part of 'imagefetch_cubit.dart';

@immutable
abstract class ImagefetchState {}

class ImagefetchInitial extends ImagefetchState {}

class ImagefectchLoading extends ImagefetchState {}

class ImagefetchLoaded extends ImagefetchState {
  final List<PicsumResult> resultdata;
  ImagefetchLoaded(this.resultdata);
}

class ImageFetchError extends ImagefetchState {}
