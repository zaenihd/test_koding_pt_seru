

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step1/controllers/register_step1_controller.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step2/controllers/register_step2_controller.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step2/views/photo_view.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step3/views/verifikasi.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/theme.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/button/button_costum.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/container/cntr.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/sizedbox/sizedbox.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/text/txt.dart';

import '../controllers/register_step3_controller.dart';

class RegisterStep3View extends GetView<RegisterStep3Controller> {
  RegisterStep3View({Key? key}) : super(key: key);
  final controllerKtp = Get.find<RegisterStep2Controller>();
  final controllerBiodata = Get.find<RegisterStep1Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Get.back();
          }, icon:  Icon(Icons.arrow_back, color: whiteColor,)),
          title: Txt(
            text: 'Verifikasi',
            color: whiteColor,
          ),
          centerTitle: true,
        ),
        bottomSheet: ButtonCostum(
            margin: const EdgeInsets.all(20),
            title: "Selesai",
            onPressed: () {
              showFlexibleBottomSheet(
                bottomSheetBorderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                minHeight: 0,
                initHeight: 0.8,
                maxHeight: 0.8,
                context: context,
                builder: _buildBottomSheet,
                isExpand: false,
              );
            },
            color: mainColor),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                SizedBox(width: 100, child: Txt(text: 'Nama')),
                Txt(
                    text:
                        ':  ${controller.dataSendApi['name']}')
              ],
            ),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 100, child: Txt(text: 'NIK')),
                    Obx(() => controller.isEdit.isTrue
                        ? Cntr(
                            height: 40,
                            width: Get.width / 1.7,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onEditingComplete: () {
                                controllerKtp.nikKtp.value =
                                    controller.nikController.text;
                                controller.isEdit.value = false;
                              },
                              controller: controller.nikController,
                            ))
                        : Txt(text: ':  ${controllerKtp.nikKtp.value}'))
                  ],
                ),
                Obx(() => Visibility(
                      visible: controller.isEdit.isFalse,
                      child: InkWell(
                          onTap: () {
                            controller.nikController.text = controllerKtp.nikKtp.value;
                            controller.isEdit.value = true;
                          },
                          child: const Icon(Icons.edit_note_outlined)),
                    ))
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                SizedBox(width: 100, child: Txt(text: "Biodata")),
                Txt(text: ':   ${controller.dataSendApi['biodata']}')
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                SizedBox(width: 100, child: Txt(text: 'Kecamatan')),
                Txt(text: ':  ${controller.dataSendApi['kecamatan']}')
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                SizedBox(width: 100, child: Txt(text: 'Kota')),
                Txt(text: ':  ${controller.dataSendApi['kota']}')
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                SizedBox(width: 100, child: Txt(text: 'Provinsi')),
                Txt(text: ':  ${controller.dataSendApi['provinsi']}')
              ],
            ),
            verticalSpace(10),
             Row(
              children: [
                SizedBox(width: 100, child: Txt(text: 'Foto KTP')),
                Txt(
                    text:
                        ':')
              ],
            ),
            verticalSpace(10),
            imageKtp(),
            verticalSpace(10),
             Row(
              children: [
                SizedBox(width: 100, child: Txt(text: 'Foto Selfie KTP')),
                Txt(
                    text:
                        ':')
              ],
            ),
            verticalSpace(10),
            imageSelfieKtp(),
            verticalSpace(100)
          ],
        ));
  }

  Cntr imageSelfieKtp() {
    return Cntr(
            alignment: Alignment.bottomRight,
            ontap: () {
              Get.to(
                  () => FotoView(
                        imageUrl: controllerKtp.imageSelfieKtpUrl.value,
                      ),
                  transition: Transition.fadeIn);
            },
            height: 400,
            width: Get.width,
            border: Border.all(
              color: greyColor,
            ),
            radius: BorderRadius.circular(10),
            image: DecorationImage(
                image: FileImage(controller.dataSendApi['imageSelfieKtp']),
                fit: BoxFit.cover),
            child: Cntr(
              ontap: () {
                Get.back();
              },
              radius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.red,
              height: 40,
              width: 40,
              child: Icon(
                Icons.edit_note_sharp,
                color: whiteColor,
              ),
            ),
          );
  }

  Cntr imageKtp() {
    return Cntr(
            alignment: Alignment.bottomRight,
            ontap: () {
              Get.to(
                  () => FotoView(
                        imageUrl: controllerKtp.imageKtpUrl.value,
                      ),
                  transition: Transition.fadeIn);
            },
            height: 200,
            width: Get.width,
            border: Border.all(
              color: greyColor,
            ),
            radius: BorderRadius.circular(10),
            image: DecorationImage(
                image: FileImage(controller.dataSendApi['imageKtp']),
                fit: BoxFit.cover),
            child: Cntr(
              ontap: () {
                Get.back();
              },
              radius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.red,
              height: 40,
              width: 40,
              child: Icon(
                Icons.edit_note_sharp,
                color: whiteColor,
              ),
            ),
          );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Cntr(
        padding: const EdgeInsets.all(20),
        width: Get.width,
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
          children: [
            Cntr(
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              color: greyYoungColor,
              radius: BorderRadius.circular(10),
            ),
            verticalSpace(36),
            Center(
              child: Txt(
                text: 'Apakah semua data sudah sesuai?',
                weight: bold,
              ),
            ),
            verticalSpace(33),
            ButtonCostum(
                margin: EdgeInsets.zero,
                title: "Ya",
                onPressed: () {
                  Get.to(() => const VerifikasiView());
                },
                color: mainColor),
            verticalSpace(20),
            ButtonCostum(
                margin: EdgeInsets.zero,
                color: Colors.grey,
                onPressed: () {
                  Navigator.pop(context);
                },
                title: 'Cek kembali'),
            verticalSpace(20)
          ],
        ),
      ),
    );
  }
}
