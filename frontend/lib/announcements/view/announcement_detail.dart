import 'package:flutter/material.dart';

class AnnouncementDetailPage extends StatelessWidget {
  const AnnouncementDetailPage({Key? key}) : super(key: key);

  static Page page() =>
      const MaterialPage<void>(child: AnnouncementDetailPage());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Announcement Detail Page'),
    );
  }
}
