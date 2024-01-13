abstract class FavoritesStates {}

class InitialFavoritesState extends FavoritesStates {}

class AddToFavSuccessState extends FavoritesStates {}

class AddToFavFailureState extends FavoritesStates {}

// class AddToFavFailureInternetState extends FavoritesStates {}

class AddToFavLoadingState extends FavoritesStates {}

class RemoveFromFavSuccessState extends FavoritesStates {}

class RemoveFromFavFailureState extends FavoritesStates {}

// class RemoveFromFavInternetFailureState extends FavoritesStates {}

class RemoveFromFavLoadingState extends FavoritesStates {}

class GetFavPostsLoadingState extends FavoritesStates {}

class GetFavPostsSuccessState extends FavoritesStates {}

class GetFavPostsFailureState extends FavoritesStates {}

class GetFavPostsInternetFailureState extends FavoritesStates {
  // final String message;

  GetFavPostsInternetFailureState();
}

class ToggleFaveStatusState extends FavoritesStates {}
