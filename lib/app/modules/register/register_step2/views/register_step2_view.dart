import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step2/views/photo_view.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/routes/app_pages.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/theme.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/button/button_costum.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/container/cntr.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/sizedbox/sizedbox.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/text/txt.dart';

import '../controllers/register_step2_controller.dart';

class RegisterStep2View extends GetView<RegisterStep2Controller> {
  const RegisterStep2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: ButtonCostum(
            margin: const EdgeInsets.all(20),
            title: "Selanjutnya",
            onPressed: () {
              if (controller.imageKtpUrl.isEmpty ||
                  controller.imageSelfieKtpUrl.isEmpty) {
                var snackBar = SnackBar(
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                    elevation: 6.0,
                    content: Text(controller.imageKtpUrl.isEmpty
                        ? "Mohon upload foto KTP!"
                        : controller.imageSelfieKtpUrl.isEmpty
                            ? " Mohon upload foto Selfie KTP!"
                            : 'Mohon lengkapi data!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                Get.toNamed(Routes.REGISTER_STEP3);
                controller.readTextFromImage(context);
              }
            },
            color: mainColor),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: whiteColor,
              )),
          title: Txt(
            text: 'Daftar',
            color: whiteColor,
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Txt(
              text: 'Foto KTP',
              size: 16,
            ),
            verticalSpace(10),
            ktpImage(context),
            verticalSpace(15),
            Txt(
              text: 'Selfie KTP',
              size: 16,
            ),
            verticalSpace(10),
            selfieKtpImage(context),
            verticalSpace(100)
          ],
        ));
  }

  Obx selfieKtpImage(BuildContext context) {
    return Obx(
      () => controller.imageSelfieKtpUrl.isEmpty
          ? Cntr(
              ontap: () {
                controller.pickerFilesSelfieImageKTP(context: context);
              },
              padding: const EdgeInsets.all(50),
              border: Border.all(
                color: greyColor,
              ),
              radius: BorderRadius.circular(10),
              child: Column(
                children: [
                  const Icon(Icons.add_a_photo_rounded),
                  verticalSpace(10),
                  Txt(text: "Upload Foto Selfie KTP")
                ],
              ),
            )
          : Cntr(
              ontap: () {
                Get.to(
                    () => FotoView(
                          imageUrl: controller.imageSelfieKtpUrl.value,
                        ),
                    transition: Transition.fadeIn);
              },
              alignment: Alignment.bottomRight,
              height: 400,
              width: Get.width,
              border: Border.all(
                color: greyColor,
              ),
              radius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: FileImage(File(controller.imageSelfieKtpUrl.value)),
                  fit: BoxFit.cover),
              child: Cntr(
                ontap: () {
                  controller.imageSelfieKtpUrl.value = "";
                  controller.filesSelfiFotoKtp = null;
                },
                radius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.red,
                height: 40,
                width: 40,
                child: Icon(
                  Icons.delete_forever,
                  color: whiteColor,
                ),
              ),
            ),
    );
  }

  Obx ktpImage(BuildContext context) {
    return Obx(
      () => controller.imageKtpUrl.isEmpty
          ? Cntr(
              ontap: () {
                controller.pickerFilesImageKTP(context: context);
              },
              padding: const EdgeInsets.all(50),
              border: Border.all(
                color: greyColor,
              ),
              radius: BorderRadius.circular(10),
              child: Column(
                children: [
                  const Icon(Icons.add_a_photo_rounded),
                  verticalSpace(10),
                  Txt(text: "Upload Foto KTP")
                ],
              ),
            )
          : Cntr(
              ontap: () {
                Get.to(
                    () => FotoView(
                          imageUrl: controller.imageKtpUrl.value,
                        ),
                    transition: Transition.fadeIn);
              },
              alignment: Alignment.bottomRight,
              height: 220,
              width: Get.width,
              border: Border.all(
                color: greyColor,
              ),
              radius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: FileImage(File(controller.imageKtpUrl.value)),
                  fit: BoxFit.cover),
              child: Cntr(
                ontap: () {
                  controller.imageKtpUrl.value = "";
                  controller.filesFotoKtp = null;
                },
                radius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.red,
                height: 40,
                width: 40,
                child: Icon(
                  Icons.delete_forever,
                  color: whiteColor,
                ),
              ),
            ),
    );
  }
}
