import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/cubit/app_cubit.dart';
import 'package:frontend/theme/color_theme.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ProfilePage());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: height * 0.05, bottom: height * 0.01),
          child: Center(
            child: Material(
              borderRadius: BorderRadius.circular(85),
              elevation: 5,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/boy_scout_image.png'),
                radius: 85,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Ben Felter",
            style: TextStyle(
                fontSize: height / 35,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900),
          ),
        ),
        TextButton(
          onPressed: null,
          child: Text(
            "edit profile",
            style: TextStyle(
                fontSize: height / 60, color: CustomColors.selectionBlue),
          ),
        ),
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            //BlocProvider.of<AppCubit>(context).toggleExpansion(index);
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    "Personal Info",
                    style: TextStyle(
                        fontSize: height / 50, color: Colors.grey.shade900),
                  ),
                );
              },
              body: Column(
                children: const [
                  ListTile(
                    leading: Icon(CupertinoIcons.mail),
                    title: Text('benbfelter@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.phone),
                    title: Text('(650)390-4495'),
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.group),
                    title: Text('Palo Alto Troop 14'),
                  ),
                ],
              ),
              isExpanded: true,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    "Groups & Permissions",
                    style: TextStyle(
                        fontSize: height / 50, color: Colors.grey.shade900),
                  ),
                );
              },
              body: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: ListTile(
                      tileColor: Colors.grey.shade300,
                      leading: Icon(CupertinoIcons.group_solid),
                      title: Text('Palo Alto Troop 14'),
                      subtitle: Text('Leader'),
                    ),
                  )),
              isExpanded: true,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    "",
                    style: TextStyle(
                        fontSize: height / 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900),
                  ),
                );
              },
              body: Container(
                child: const Text("test"),
                padding: const EdgeInsets.all(8.0),
              ),
              isExpanded: false,
            ),
          ],
        ),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                BlocProvider.of<AppCubit>(context).unauthenticate();
              },
            )),
      ],
    );
  }
}


// IconButton(
//       icon: const Icon(Icons.logout),
//       onPressed: () {
//         BlocProvider.of<AppCubit>(context).unauthenticate();
//       },
//     );