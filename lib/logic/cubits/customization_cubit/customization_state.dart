part of 'customization_cubit.dart';

@immutable
abstract class CustomizationState {
  final XFile? image;
  final String? gender;
  final String? birthDate;
  final String? country;
  final String? title;
  final String? username;

  CustomizationState({
    XFile? image,
    String? gender,
    String? birthDate,
    String? country,
    String? title,
    String? username,
  })  : image = image ?? XFile(''),
        gender = gender ?? '',
        birthDate = birthDate ?? '',
        country = country ?? '',
        title = title ?? '',
        username = username ?? '';
}

class CustomizationInitial extends CustomizationState {}

//* customization check states
class CustomizationExistCheck_Loading extends CustomizationState {}

class CustomizationExistCheck_Exists extends CustomizationState {}

class CustomizationExistCheck_NotExisting extends CustomizationState {}

//* add customization states
class AddCustomization_Loading extends CustomizationState {}

class AddCustomization_Success extends CustomizationState {
  AddCustomization_Success({
    required super.image,
    required super.birthDate,
    required super.country,
    required super.gender,
    required super.title,
    required super.username,
  });
}

class AddCustomization_Failure extends CustomizationState {}
