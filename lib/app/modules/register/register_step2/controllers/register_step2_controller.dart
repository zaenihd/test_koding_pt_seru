
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegisterStep2Controller extends GetxController {
  final ImagePicker _picker = ImagePicker();
  // ignore: prefer_typing_uninitialized_variables
  var filesFotoKtp;
  // ignore: prefer_typing_uninitialized_variables
  var filesSelfiFotoKtp;
  RxString imageKtpUrl = "".obs;
  RxString imageSelfieKtpUrl = "".obs;
  RxString nikKtp = "".obs;
  CroppedFile? croppedFileKtp;
  CroppedFile? croppedFileSelfieKtp;

  Future<File?> takePhotoKtp(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final File? file = File(image!.path);
    filesFotoKtp == file;
    filesFotoKtp = File(image.path);
    return file;
  }

  Future<File?> takePhotoSelfieKtp(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final File? file = File(image!.path);
    filesSelfiFotoKtp == file;
    filesSelfiFotoKtp = File(image.path);
    return file;
  }

  void pickerFilesImageKTP({
    required BuildContext context,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Photo"),
                onTap: () async {
                  await takePhotoKtp(ImageSource.gallery);
                  if (filesFotoKtp != null) {
                    croppedFileKtp = await ImageCropper().cropImage(
                      sourcePath: filesFotoKtp.path,
                      aspectRatioPresets: [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9
                      ],
                      uiSettings: [
                        AndroidUiSettings(
                            toolbarTitle: 'Cropper',
                            toolbarColor: Colors.deepOrange,
                            toolbarWidgetColor: Colors.white,
                            initAspectRatio: CropAspectRatioPreset.original,
                            lockAspectRatio: false),
                        IOSUiSettings(
                          title: 'Cropper',
                        ),
                        // ignore: use_build_context_synchronously
                        WebUiSettings(
                          context: context,
                        ),
                      ],
                    );
                  }
                  imageKtpUrl.value = croppedFileKtp!.path;
                  Get.back();
                  // takePhoto(ImageSource.gallery);
                  // Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () async {
                  await takePhotoKtp(ImageSource.camera);
                  if (filesFotoKtp != null) {
                    croppedFileKtp = await ImageCropper().cropImage(
                      sourcePath: filesFotoKtp.path,
                      aspectRatioPresets: [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9
                      ],
                      uiSettings: [
                        AndroidUiSettings(
                            toolbarTitle: 'Cropper',
                            toolbarColor: Colors.deepOrange,
                            toolbarWidgetColor: Colors.white,
                            initAspectRatio: CropAspectRatioPreset.original,
                            lockAspectRatio: false),
                        IOSUiSettings(
                          title: 'Cropper',
                        ),
                        // ignore: use_build_context_synchronously
                        WebUiSettings(
                          context: context,
                        ),
                      ],
                    );
                  }
                  imageKtpUrl.value = croppedFileKtp!.path;
                  // takePhotoKtp(ImageSource.camera);
                  Get.back();
                },
              )
            ],
          );
        });
  }

  void pickerFilesSelfieImageKTP({
    required BuildContext context,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Photo"),
                onTap: () async {
                  await takePhotoSelfieKtp(ImageSource.gallery);
                  if (filesSelfiFotoKtp != null) {
                    croppedFileSelfieKtp = await ImageCropper().cropImage(
                      sourcePath: filesSelfiFotoKtp.path,
                      aspectRatioPresets: [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9
                      ],
                      uiSettings: [
                        AndroidUiSettings(
                            toolbarTitle: 'Cropper',
                            toolbarColor: Colors.deepOrange,
                            toolbarWidgetColor: Colors.white,
                            initAspectRatio: CropAspectRatioPreset.original,
                            lockAspectRatio: false),
                        IOSUiSettings(
                          title: 'Cropper',
                        ),
                        // ignore: use_build_context_synchronously
                        WebUiSettings(
                          context: context,
                        ),
                      ],
                    );
                  }
                  imageSelfieKtpUrl.value = croppedFileSelfieKtp!.path;
                  Get.back();
                  // takePhoto(ImageSource.gallery);
                  // Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () async {
                  await takePhotoSelfieKtp(ImageSource.camera);
                  if (filesSelfiFotoKtp != null) {
                    croppedFileSelfieKtp = await ImageCropper().cropImage(
                      sourcePath: filesSelfiFotoKtp.path,
                      aspectRatioPresets: [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9
                      ],
                      uiSettings: [
                        AndroidUiSettings(
                            toolbarTitle: 'Cropper',
                            toolbarColor: Colors.deepOrange,
                            toolbarWidgetColor: Colors.white,
                            initAspectRatio: CropAspectRatioPreset.original,
                            lockAspectRatio: false),
                        IOSUiSettings(
                          title: 'Cropper',
                        ),
                        // ignore: use_build_context_synchronously
                        WebUiSettings(
                          context: context,
                        ),
                      ],
                    );
                  }
                  imageKtpUrl.value = croppedFileSelfieKtp!.path;
                  Get.back();
                },
              )
            ],
          );
        });
  }

  Future<void> readTextFromImage(BuildContext context) async {
    final inputImage = InputImage.fromFile(File(imageKtpUrl.value));
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    String data = text.split('32')[1];
    nikKtp.value= data.substring(0,16);
    textRecognizer.close();
  }
}
