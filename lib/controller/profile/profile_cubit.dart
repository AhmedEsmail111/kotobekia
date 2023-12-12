import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/controller/profile/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);
}
