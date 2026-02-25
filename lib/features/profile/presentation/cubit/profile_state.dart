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

  ProfileLoaded({
    required this.fullName,
    required this.email,
    required this.gender,
    required this.birthday,
    this.imageUrl,
    this.isImageUploading = false,
  });

  ProfileLoaded copyWith({
    String? fullName,
    String? email,
    String? gender,
    String? birthday,
    String? imageUrl,
    bool? isImageUploading,
  }) {
    return ProfileLoaded(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      imageUrl: imageUrl ?? this.imageUrl,
      isImageUploading: isImageUploading ?? this.isImageUploading,
    );
  }
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
