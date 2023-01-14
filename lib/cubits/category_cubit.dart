import 'package:bloc/bloc.dart';
import 'package:me_bored/models/activity.model.dart';
import 'package:me_bored/services/boring-api.service.dart';

/// {@template category_cubit}
/// A [Cubit] which manages a category as its state.
/// {@endtemplate}
class CategoryCubit extends Cubit<String> {
  /// {@macro category_cubit}
  CategoryCubit() : super("");

  void setCategory(String category) => emit(category);

  void removeCategory() => emit("");
}