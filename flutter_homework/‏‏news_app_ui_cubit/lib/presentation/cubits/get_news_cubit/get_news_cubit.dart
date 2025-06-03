import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ui_setup/presentation/cubits/get_news_cubit/get_news_cubit_states.dart';
import 'package:news_app_ui_setup/domain/usecases/get_news_usecase.dart';

class GetNewsCubit extends Cubit<NewsStates> {
  final GetNewsUseCase getNewsUseCase;

  GetNewsCubit(this.getNewsUseCase) : super(NewsInitialState());

  Future<void> getNews({required String category}) async {
    emit(NewsLoadingState());
    try {
      final articles = await getNewsUseCase.call(category);
      emit(NewsLoadedState(articleModel: articles));
    } catch (e) {
      emit(NewsFailureState(error: e.toString()));
    }
  }
}
