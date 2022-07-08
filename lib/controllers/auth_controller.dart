import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/constants.dart';
import 'package:tiktokclone/modals/user.dart' as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      Get.snackbar("Profile Picture", 'You have sucessfully selected');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

// Uplad data to firestore

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void registerUSer(
      String username, String email, String password, File? image) async {
    try {
      if (username.isEmpty &&
          email.isEmpty &&
          password.isEmpty &&
          image != null) {
        //save the dataa to the firebase storage
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);

        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
            "Error Creating an account ", 'Please enter all the feild');
      }
    } catch (e) {
      Get.snackbar(
        "Error Creating an account ",
        e.toString(),
      );
    }
  }
}
