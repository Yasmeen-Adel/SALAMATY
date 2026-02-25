import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'profile_state.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ImagePicker _picker = ImagePicker();
  final AuthRepo _repo = getIt<AuthRepo>();

  String? imageUrl;
  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      final response = await _repo.getProfile();

      if (response['success'] != true) {
        throw Exception("Failed");
      }

      final profile = response['data'];

      imageUrl = profile['imageUrl'];

      await AuthLocalStorage.saveProfileImage(imageUrl ?? '');
      await AuthLocalStorage.saveAddress(profile['address'] ?? '');

      emit(
        ProfileLoaded(
          fullName: profile['fullName'] ?? '',
          email: profile['email'] ?? '',
          gender: profile['genderText'] ?? '',
          imageUrl: imageUrl,
          // birthday: profile['birthDate'] ?? 'Birthday not set',
          birthday: profile['birthDateText'] ?? 'Birthday',
        ),
      );
    } catch (e) {
      emit(ProfileError("Failed to load profile"));
    }
  }

  Future<void> pickAndUploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    if (state is! ProfileLoaded) return;

    final currentState = state as ProfileLoaded;

    emit(currentState.copyWith(isImageUploading: true));

    try {
      final uploadedUrl = await _repo.uploadProfileImage(image.path);

      imageUrl = uploadedUrl;

      await AuthLocalStorage.saveProfileImage(uploadedUrl);

      emit(
        currentState.copyWith(
          imageUrl: uploadedUrl,
          isImageUploading: false,
        ),
      );
    } catch (e) {
      emit(currentState.copyWith(isImageUploading: false));
    }
  }

  Future<void> loadSavedImage() async {
    imageUrl = await AuthLocalStorage.getProfileImage();
  }
}
