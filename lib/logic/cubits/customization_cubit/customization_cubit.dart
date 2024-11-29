import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customization_state.dart';

class CustomizationCubit extends Cubit<CustomizationState> {
  CustomizationCubit() : super(CustomizationInitial());
}
