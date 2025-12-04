import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:di/di_data.dart';
import 'package:di/di_domain.dart';

import 'controllers/home_page_controller.dart';
import 'pages/home_page.dart';
import 'pages/course_display_page.dart';

void main() {
  initDataDependencies();

  initDomainDependencies();

  Get.lazyPut(() => HomePageController(getFeedUseCase: Get.find()));

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      '/course-display-page': (context) => const CourseDisplayPage()
    },
  ));
}
