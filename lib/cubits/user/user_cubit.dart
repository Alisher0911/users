import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makit/cubits/user/user_state.dart';
import 'package:makit/data/repositories/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(
    this._userRepository
  ) : super(UserState.loading());

  Future<void> getUsers() async {
    emit(state.copyWith(userStatus: UserStatus.loading));
    try {
      final users = await _userRepository.getUsers();
      emit(state.copyWith(users: users, userStatus: UserStatus.success));
    } catch (e) {
      emit(state.copyWith(userStatus: UserStatus.error));
    }
  }
}
