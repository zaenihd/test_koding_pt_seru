import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/constant/kecamatan.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/constant/kota.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/constant/provinsi.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/routes/app_pages.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/image_url.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/theme.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/button/button_costum.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/sizedbox/sizedbox.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/text/txt.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/textform/txtform.dart';

import '../controllers/register_step1_controller.dart';

class RegisterStep1View extends GetView<RegisterStep1Controller> {
  RegisterStep1View({Key? key}) : super(key: key);
  final keyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: ButtonCostum(
            margin: const EdgeInsets.all(20),
            title: "Selanjutnya",
            onPressed: () {
              final isValiForm = keyRegister.currentState!.validate();
              if (isValiForm) {
                Get.toNamed(Routes.REGISTER_STEP2);
              }
            },
            color: mainColor),
        body: Form(
          key: keyRegister,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            children: [
              Image.asset(
                daftar,
                height: 200,
              ),
              verticalSpace(30),
              Txt(
                text: 'Nama Depan',
                size: 16,
              ),
              TxtForm(
                borderColor: greyColor,
                hintText: 'Masukan nama depan',
                onChange: (p0) {},
                controller: controller.firstNameController,
                onTap: () {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return "nama depan tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
              ),
              verticalSpace(10),
              Txt(
                text: 'Nama Belakang',
                size: 16,
              ),
              TxtForm(
                borderColor: greyColor,
                hintText: 'Masukan nama belakang',
                onChange: (p0) {},
                controller: controller.lastNameController,
                onTap: () {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return "nama belakang tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
              ),
              verticalSpace(10),
              Txt(
                text: 'Biodata',
                size: 16,
              ),
              TxtForm(
                maxLines: 5,
                borderColor: greyColor,
                hintText: 'Masukan biodata',
                onChange: (p0) {},
                controller: controller.biodataController,
                onTap: () {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return "biodata tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
              ),
              verticalSpace(10),
              Txt(
                text: 'Provinsi',
                size: 16,
              ),
              verticalSpace(10),
              provinsi(),
              verticalSpace(25),
              Txt(
                text: 'Kota/Kabupaten',
                size: 16,
              ),
              verticalSpace(10),
              kota(),
              verticalSpace(25),
              Txt(
                text: 'Kecamatan',
                size: 16,
              ),
              verticalSpace(10),
              kecamatanDrop(),
              verticalSpace(30)
            ],
          ),
        ));
  }

  Container kecamatanDrop() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greyColor, width: 2)),
      child: Obx(
        () => DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return "Kecamatan tidak boleh kosong";
            } else {
              return null;
            }
          },
          value: controller.isSelectedKecamatan.isTrue
              ? controller.selectedKecamatan.value
              : null,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              fillColor: whiteColor,
              filled: true,
              hintText: "Pilih Kecamatan...",
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          items: controller.kecamatanByCity
              .map((e) => DropdownMenuItem(
                  onTap: () {
                    // controller.provinceId.value = e['id'].toString();
                  },
                  value: e['name'],
                  child: Text(e['name'].toString())))
              .toList(),
          onChanged: (value) {
            controller.selectedKecamatan.value = value.toString();
            controller.isSelectedKecamatan.value = true;
          },
        ),
      ),
    );
  }

  Container kota() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greyColor, width: 2)),
      child: Obx(
        () => DropdownButtonFormField(
          value: controller.isSelectedKota.isTrue
              ? controller.selectedKota.value
              : null,
          validator: (value) {
            if (value == null) {
              return "Kota tidak boleh kosong";
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              fillColor: whiteColor,
              filled: true,
              hintText: "Pilih Kota...",
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          items: controller.cityByProvince
              .map((e) => DropdownMenuItem(
                  onTap: () {
                    controller.cityId.value = e['city_id'];
                  },
                  value: e['name'],
                  child: Text(e['name'].toString())))
              .toList(),
          onChanged: (value) {
            controller.isSelectedKota.value = true;
            controller.selectedKota.value = value.toString();
            controller.kecamatanByCity.clear();
            controller.kecamatanByCity.value = kecamatan
                .where(
                    (element) => element['city_id'] == controller.cityId.value)
                .toList();
            controller.isSelectedKecamatan.value = false;
          },
        ),
      ),
    );
  }

  Container provinsi() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greyColor, width: 2)),
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null) {
            return "Provinsi tidak boleh kosong";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            fillColor: whiteColor,
            filled: true,
            hintText: "Pilih Provinsi...",
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        items: provinsiIndonesia
            .map((e) => DropdownMenuItem(
                onTap: () {
                  controller.provinceId.value = e['provinces_id'];
                },
                value: e['name'],
                child: Text(e['name'].toString())))
            .toList(),
        onChanged: (value) {
          controller.selectedProvinsi.value = value.toString();
          controller.cityByProvince.clear();
          controller.cityByProvince.value = kotaIndonesia
              .where((element) =>
                  element['provinces_id'] == controller.provinceId.value)
              .toList();
          controller.isSelectedKota.value = false;
          controller.isSelectedKecamatan.value = false;
        },
      ),
    );
  }
}
