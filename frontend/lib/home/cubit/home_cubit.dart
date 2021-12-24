import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.Announcements());

  void announcementsToggled() {
    emit(const HomeState.Announcements());
  }

  void tasksToggled() {
    emit(const HomeState.Tasks());
  }

  void profileToggled() {
    emit(const HomeState.Profile());
  }
}
