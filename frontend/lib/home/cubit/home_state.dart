part of 'home_cubit.dart';

enum HomeStatus {
  Announcements,
  Tasks,
  Profile,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String title;

  const HomeState._({required this.status, required this.title});

  const HomeState.Announcements()
      : this._(
          status: HomeStatus.Announcements,
          title: "Announcements",
        );

  const HomeState.Tasks()
      : this._(
          status: HomeStatus.Tasks,
          title: "Tasks",
        );

  const HomeState.Profile()
      : this._(
          status: HomeStatus.Profile,
          title: "Profile",
        );

  @override
  List<Object> get props => [status, title];
}
