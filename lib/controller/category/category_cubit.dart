import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/category/category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(InitialCategoryState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  bool isGrid = true;
  void changeLayout(status) {
    isGrid = status;
    emit(ChangeLayoutCategoryState());
  }
}
