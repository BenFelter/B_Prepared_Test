import 'package:flutter/material.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/home/home.dart';
import 'package:frontend/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
