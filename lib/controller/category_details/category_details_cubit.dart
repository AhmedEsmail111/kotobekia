import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/category_details/category_details_states.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:share_plus/share_plus.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsStates> {
  CategoryDetailsCubit() : super(InitialCategoryDetailsState());

  static CategoryDetailsCubit get(context) => BlocProvider.of(context);

  void sharePost(String postUrl) {
    final url = Uri.parse('${AppConstant.baseShareUrl}/post/$postUrl');
    Share.shareUri(url);
  }
}
