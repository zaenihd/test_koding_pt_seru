import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step1/controllers/register_step1_controller.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step2/controllers/register_step2_controller.dart';

class RegisterStep3Controller extends GetxController {
  RxBool isEdit = false.obs;
  TextEditingController nikController = TextEditingController();
  @override
  void onInit() {
    nikController.text = Get.find<RegisterStep2Controller>().nikKtp.value;
    super.onInit();
  }

  Map<String, dynamic> dataSendApi = {
    "name":
        "${Get.find<RegisterStep1Controller>().firstNameController.text} ${Get.find<RegisterStep1Controller>().lastNameController.text}",
    "nik": Get.find<RegisterStep2Controller>().nikKtp.value,
    "biodata": Get.find<RegisterStep1Controller>().biodataController.text,
    "kecamatan": Get.find<RegisterStep1Controller>().selectedKecamatan.value,
    "kota": Get.find<RegisterStep1Controller>().selectedKota.value,
    "provinsi": Get.find<RegisterStep1Controller>().selectedProvinsi.value,
    "imageKtp": File(Get.find<RegisterStep2Controller>().imageKtpUrl.value),
    "imageSelfieKtp":
        File(Get.find<RegisterStep2Controller>().imageSelfieKtpUrl.value),
  };
}
