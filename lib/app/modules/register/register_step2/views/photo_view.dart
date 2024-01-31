import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step2/controllers/register_step2_controller.dart';

// ignore: must_be_immutable
class FotoView extends StatelessWidget {
  FotoView({super.key, required this.imageUrl});
  final controller = Get.find<RegisterStep2Controller>();
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
            child: PhotoView(
      imageProvider: FileImage(File(imageUrl)),
    )));
  }
}
