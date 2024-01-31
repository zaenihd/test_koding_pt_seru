import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch: mainColor
      ),
      title: "Application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
