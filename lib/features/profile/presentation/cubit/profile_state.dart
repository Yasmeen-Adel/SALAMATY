abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String fullName;
  final String email;
  final String gender;
  final String? imageUrl;
  final String birthday;
  final bool isImageUploading;
  final String? localImagePath;

  ProfileLoaded({
    required this.fullName,
    required this.email,
    required this.gender,
    required this.birthday,
    this.imageUrl,
    this.isImageUploading = false,
    this.localImagePath,
  });

  ProfileLoaded copyWith({
    String? fullName,
    String? email,
    String? gender,
    String? birthday,
    String? imageUrl,
    bool? isImageUploading,
    String? localImagePath,
    bool clearLocalImage = false,
  }) {
    return ProfileLoaded(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      imageUrl: imageUrl ?? this.imageUrl,
      isImageUploading: isImageUploading ?? this.isImageUploading,
      localImagePath:
          clearLocalImage ? null : (localImagePath ?? this.localImagePath),
    );
  }
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}