import 'package:flutter/material.dart';
import 'package:frontend/announcements/view/announcements_page.dart';
import 'package:frontend/home/home.dart';
import 'package:frontend/profile/profile.dart';
import 'package:frontend/tasks/view/tasks_page.dart';

List<Page> onGenerateHomeViewPages(
    HomeStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case HomeStatus.Announcements:
      return [AnnouncementsPage.page()];
    case HomeStatus.Tasks:
      return [TasksPage.page()];
    case HomeStatus.Profile:
      return [ProfilePage.page()];
  }
}
