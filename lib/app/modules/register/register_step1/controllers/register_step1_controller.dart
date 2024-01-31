import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStep1Controller extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController biodataController = TextEditingController();
  RxInt provinceId = 0.obs;
  RxInt cityId = 0.obs;
  RxList cityByProvince = [].obs;
  RxList kecamatanByCity = [].obs;
  RxString selectedKecamatan = "".obs;
  RxString selectedKota = "".obs;
  RxString selectedProvinsi = "".obs;
  RxBool isSelectedKota = false.obs;
  RxBool isSelectedKecamatan = false.obs;
}
