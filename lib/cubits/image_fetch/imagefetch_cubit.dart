import 'package:bloc/bloc.dart';
import 'package:demo/models/picsum_result/picsum_result.dart';
import 'package:demo/services/http_service/http_service.dart';
import 'package:demo/services/locator/locator.dart';
import 'package:meta/meta.dart';

part 'imagefetch_state.dart';

class ImagefetchCubit extends Cubit<ImagefetchState> {
  ImagefetchCubit() : super(ImagefetchInitial());

  Future<void> fetchData() async {
    emit(ImagefectchLoading());
    final result = await sl<HttpService>().getData();
    if (result.isNotEmpty) {
      emit(
        ImagefetchLoaded(result),
      );
    } else {
      emit(
        ImageFetchError(),
      );
    }
  }
}
