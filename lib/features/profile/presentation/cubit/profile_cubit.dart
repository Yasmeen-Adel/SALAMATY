import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'profile_state.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ImagePicker _picker = ImagePicker();

  String? imageUrl;

  Future<void> pickAndUploadImage() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    emit(ProfileLoading());

    try {
      final uploadedUrl =
          await getIt<AuthRepo>().uploadProfileImage(image.path);

      imageUrl = uploadedUrl;

      await AuthLocalStorage.saveProfileImage(uploadedUrl);

      emit(ProfileImageUpdated(uploadedUrl));
    } catch (e) {
      emit(ProfileError("Failed to upload image"));
    }
  }

  Future<void> loadSavedImage() async {
    final savedUrl = await AuthLocalStorage.getProfileImage();
    if (savedUrl != null) {
      imageUrl = savedUrl;
      emit(ProfileImageUpdated(savedUrl));
    }
  }
}
