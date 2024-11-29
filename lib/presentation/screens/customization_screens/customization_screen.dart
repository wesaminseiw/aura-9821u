import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/localization/l10n.dart';
import 'package:aura/logic/cubits/customization_cubit/customization_cubit.dart';
import 'package:aura/presentation/widgets/circular_indicator.dart';
import 'package:aura/presentation/widgets/sizedbox.dart';
import 'package:aura/presentation/widgets/snackbar.dart';
import 'package:aura/presentation/widgets/submit_button.dart';
import 'package:aura/presentation/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

TextEditingController birthDateController = TextEditingController();
TextEditingController countryController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController titleController = TextEditingController();
final ImagePicker _picker = ImagePicker();
XFile? _imageFile;

class CustomizationScreen extends StatefulWidget {
  const CustomizationScreen({super.key});

  @override
  State<CustomizationScreen> createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  List<String> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    _filteredCountries = List.from(countries); // Populate the initial list
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: BlocListener<CustomizationCubit, CustomizationState>(
        listener: (context, state) {
          if (state is AddCustomization_Success) {
            AppRouter.offHome();
          } else if (state is AddCustomization_Failure) {
            shortTimeSnackBar(context, content: somethingWentWrong);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(customization),
          ),
          body: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              height(48),
              Padding(
                padding: horizontalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last step!',
                      style: context.headlineLarge!.copyWith(color: context.colorScheme.primary),
                    ),
                    Text(
                      // textAlign: TextAlign.center,
                      style: context.bodyLarge,
                      'Now you\'ll need to customize your account, such as image, title, and other properties',
                    ),
                  ],
                ),
              ),
              height(48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage, // When tapped, pick an image
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey[300], // Background color
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: _imageFile == null
                            ? Padding(
                                padding: const EdgeInsets.all(50),
                                child: Image.asset(
                                  cameraImagePath, // Default image
                                  fit: BoxFit.contain,
                                  width: 100,
                                  height: 100,
                                ),
                              )
                            : Image.file(
                                File(_imageFile!.path), // Display selected image
                                fit: BoxFit.cover,
                                width: 130,
                                height: 130,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              height(56),
              Padding(
                padding: horizontalPadding,
                child: Column(
                  children: [
                    textfield(
                      context,
                      hint: enterTitleHint,
                      keyboardType: TextInputType.text,
                      label: titleLabel,
                      controller: titleController,
                    ),
                    height(20),
                    textfield(
                      context,
                      hint: enterCountryHint,
                      keyboardType: TextInputType.text,
                      label: countryLabel,
                      controller: countryController,
                      readOnly: true,
                      onTap: _showCountrySelectionDialog,
                    ),
                    height(20),
                    Row(
                      children: [
                        Expanded(
                          child: textfield(
                            context,
                            hint: birthDateHint,
                            label: birthDateLabel,
                            keyboardType: TextInputType.datetime,
                            controller: birthDateController,
                            readOnly: true,
                            onTap: () async {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900, 1, 1),
                                lastDate: DateTime.now(),
                                initialDate: DateTime.now(),
                              );
                              if (selectedDate != null) {
                                // Format the date as a string and assign it to the textController
                                birthDateController.text = DateFormat('yyyy/MM/dd').format(selectedDate); // Format to YYYY-MM-DD
                              }
                            },
                          ),
                        ),
                        width(22),
                        Expanded(
                          child: textfield(
                            context,
                            controller: genderController,
                            readOnly: true,
                            onTap: () async {
                              // Show the gender selection bottom sheet
                              String? selectedGender = await showModalBottomSheet<String>(
                                context: context,
                                builder: (BuildContext context) {
                                  return GenderPicker();
                                },
                              );

                              if (selectedGender != null) {
                                // Set the selected gender to the controller
                                genderController.text = selectedGender;
                              }
                            },
                            hint: genderHint,
                            label: genderLabel,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    height(22),
                    BlocBuilder<CustomizationCubit, CustomizationState>(
                      builder: (context, state) {
                        return state is AddCustomization_Loading
                            ? loading()
                            : submitButton(
                                context,
                                label: confirmButton_Label,
                                onTap: () async {
                                  if (titleController.text.isNotEmpty &&
                                      countryController.text.isNotEmpty &&
                                      birthDateController.text.isNotEmpty &&
                                      genderController.text.isNotEmpty &&
                                      _imageFile != null) {
                                    await context.read<CustomizationCubit>().uploadCustomization(
                                          image: _imageFile!,
                                          title: titleController.text,
                                          country: countryController.text,
                                          birthDate: birthDateController.text,
                                          gender: genderController.text,
                                        );
                                  } else {
                                    shortTimeSnackBar(context, content: emptyFieldsSnackbarTitle);
                                  }
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCountrySelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredCountries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredCountries[index]),
                      onTap: () {
                        setState(() {
                          countryController.text = _filteredCountries[index];
                        });
                        Navigator.pop(context); // Close the dialog
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery); // Open gallery

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile; // Store the image
      });
    }
  }
}

class GenderPicker extends StatelessWidget {
  const GenderPicker({super.key});

  @override
  Widget build(BuildContext context) {
    // List of gender options
    List<String> genderOptions = [male, female, preferNotToSay];

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: genderOptions.map((gender) {
          return ListTile(
            title: Text(gender),
            onTap: () {
              Navigator.pop(context, gender); // Return the selected gender
            },
          );
        }).toList(),
      ),
    );
  }
}
