import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step1/bindings/register_step1_binding.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step1/views/register_step1_view.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step2/bindings/register_step2_binding.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step2/views/register_step2_view.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step3/bindings/register_step3_binding.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/modules/register/register_step3/views/register_step3_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP1,
      page: () =>  RegisterStep1View(),
      binding: RegisterStep1Binding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP2,
      page: () => const RegisterStep2View(),
      binding: RegisterStep2Binding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP3,
      page: () =>  RegisterStep3View(),
      binding: RegisterStep3Binding(),
    ),
  ];
}
