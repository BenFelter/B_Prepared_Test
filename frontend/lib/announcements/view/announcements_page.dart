import 'package:flutter/material.dart';
import 'package:frontend/models/test_models.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: AnnouncementsPage());

  @override
  Widget build(BuildContext context) {
    List<Announcement> announcements = TestModels.getAnnouncements();
    return Container(
        child: ListView(
      children: [
        for (final announcement in announcements)
          AnnouncementTile(announcement: announcement),
      ],
    ));
  }
}

class AnnouncementTile extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementTile({required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.only(left: 2, right: 2),
      child: Card(
        child: ListTile(
          minVerticalPadding: 13,
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/boy_scout_image.png'),
          ), // profile image, circleavatar
          trailing: const Text('WED'), //date indicator
          title: Row(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                announcement.title,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
          subtitle: Text(
            announcement.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
          dense: true,
        ),
      ),
    ); // listtile for that index
  }
}
