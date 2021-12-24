import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/home/home.dart';
import 'package:frontend/theme/color_theme.dart';
import 'package:frontend/theme/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomePageView(),
    );
  }
}

Widget announcementButton() {
  return Container(
      child: FloatingActionButton(
    onPressed: () {},
    backgroundColor: CustomColors.scoutingBlue,
    focusColor: CustomColors.selectionBlue,
    focusElevation: 16.0,
    elevation: 2.0,
    heroTag: 'see',
    child: const Icon(
      Icons.list,
      color: Colors.white,
    ),
  ));
}

Widget taskButton() {
  return Container(
      child: FloatingActionButton(
    onPressed: () {},
    backgroundColor: CustomColors.scoutingBlue,
    focusColor: CustomColors.selectionBlue,
    focusElevation: 16.0,
    elevation: 2.0,
    heroTag: 'see',
    child: const Icon(
      Icons.task,
      color: Colors.white,
    ),
  ));
}

Widget groupButton() {
  return Container(
      child: FloatingActionButton(
    onPressed: () {},
    backgroundColor: CustomColors.scoutingBlue,
    focusColor: CustomColors.selectionBlue,
    focusElevation: 16.0,
    elevation: 2.0,
    heroTag: 'see',
    child: const Icon(
      Icons.group,
      color: Colors.white,
    ),
  ));
}

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String selectedPage = "announcements";
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 0, 14),
              child: SvgPicture.asset(
                'assets/Logo-B.svg',
              ),
            ),
            title: Text(
              state.title,
              style: TextStyle(fontSize: width / 15),
            ),
            // actions: [
            //   IconButton(
            //     color: (state.status == HomeStatus.Profile)
            //         ? kPrimaryColor
            //         : Colors.grey,
            //     icon: const Icon(Icons.circle),
            //     onPressed: () {
            //       context.read<HomeCubit>().profileToggled();
            //     },
            //   ),
            // ],
          ),
          body: FlowBuilder<HomeStatus>(
            state: context.select((HomeCubit bloc) => bloc.state.status),
            onGeneratePages: onGenerateHomeViewPages,
          ),
          floatingActionButton: Container(
            margin: EdgeInsets.only(right: width / 30),
            child: SpeedDial(
              backgroundColor: CustomColors.scoutingBlue,
              animatedIcon: AnimatedIcons.add_event,
              foregroundColor: Colors.white,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.group),
                  label: "New Group",
                  onTap: () => {},
                ),
                SpeedDialChild(
                  child: const Icon(Icons.task),
                  label: "Assign Task",
                  onTap: () => {},
                ),
                SpeedDialChild(
                  child: const Icon(Icons.list),
                  label: "Announcement",
                  onTap: () => {},
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomAppBar(
            child: Container(
              margin: EdgeInsets.only(right: width / 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    color: (state.status == HomeStatus.Announcements)
                        ? kPrimaryColor
                        : Colors.grey,
                    icon: const Icon(CupertinoIcons.envelope),
                    onPressed: () {
                      context.read<HomeCubit>().announcementsToggled();
                    },
                  ),
                  IconButton(
                    color: (state.status == HomeStatus.Tasks)
                        ? kPrimaryColor
                        : Colors.grey,
                    icon: const Icon(CupertinoIcons.checkmark_circle),
                    onPressed: () {
                      context.read<HomeCubit>().tasksToggled();
                    },
                  ),
                  IconButton(
                    color: (state.status == HomeStatus.Profile)
                        ? kPrimaryColor
                        : Colors.grey,
                    icon: const Icon(CupertinoIcons.person),
                    onPressed: () {
                      context.read<HomeCubit>().profileToggled();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class HomePageViewView extends StatelessWidget {
//   const HomePageViewView({Key? key}) : super(key: key);

//   static Page page() => const MaterialPage<void>(child: HomePageViewView());

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Home Page'),
//     );
//   }
// }
