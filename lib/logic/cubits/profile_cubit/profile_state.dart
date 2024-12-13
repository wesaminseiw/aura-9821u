part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {
  final String imageUrl;

  const ProfileState({required this.imageUrl});
}

class ProfileInitial extends ProfileState {
  const ProfileInitial({required super.imageUrl});
}

// GetProfileImage States
class GetProfileImage_Loading extends ProfileState {
  const GetProfileImage_Loading({required super.imageUrl});
}

class GetProfileImage_Success extends ProfileState {
  const GetProfileImage_Success({required super.imageUrl});
}

class GetProfileImage_Failure extends ProfileState {
  const GetProfileImage_Failure({required super.imageUrl});
}
