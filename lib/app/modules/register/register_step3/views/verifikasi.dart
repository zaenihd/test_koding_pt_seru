import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/routes/app_pages.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/image_url.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/theme/theme.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/button/button_costum.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/sizedbox/sizedbox.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/text/txt.dart';

class VerifikasiView extends StatelessWidget {
  const VerifikasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(verifikasi,color: mainColor,),
          verticalSpace(30),
          Txt(text: 'Berhasil Mendaftar!', size: 20, weight: semiBold,),
          verticalSpace(20),
          ButtonCostum(
            margin: const EdgeInsets.symmetric(horizontal: 90),
            title: "Home", onPressed: (){
              Get.offAllNamed(Routes.HOME);
            }, color: mainColor)
        ],),
      ),
    );
  }
}