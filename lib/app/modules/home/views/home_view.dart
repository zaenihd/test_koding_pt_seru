import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/routes/app_pages.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/image_url.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/theme.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/button/button_costum.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/sizedbox/sizedbox.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/text/txt.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              register,
              width: 300,
            ),
            verticalSpace(30),
            Txt(
              text: 'Ayo bergabung bersama PT.SERU',
              size: 20,
              weight: semiBold,
            ),
            verticalSpace(20),
            ButtonCostum(
                margin: const EdgeInsets.symmetric(horizontal: 90),
                title: "Daftar",
                onPressed: () {
                  Get.toNamed(Routes.REGISTER_STEP1);
                },
                color: mainColor)
          ],
        ),
      ),
    );
  }
}
