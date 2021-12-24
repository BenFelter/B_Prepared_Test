import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.unauthenticated());

  void authenticate() {
    emit(AppState.authenticated(User.anonymous));
  }

  void unauthenticate() {
    emit(AppState.unauthenticated());
  }
}
