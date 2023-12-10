import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/favorites/favorites_states.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit() : super(InitialFavoritesState());

  static FavoritesCubit get(context) => BlocProvider.of(context);
}
