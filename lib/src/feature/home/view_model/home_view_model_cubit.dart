import 'package:app_note_local/src/feature/home/view_model/home_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../constant/app_const_hive.dart';
import '../../../model/model_note.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelLoading());
  List<ModelNotes> notesList = [];
  getAllNotes() async {
    try {
      var notsBox = Hive.box<ModelNotes>(openBox);
      notesList = notsBox.values.toList();
      emit(HomeViewModelSuccess(notsBox.values.toList()));
    } catch (e) {
      emit(HomeViewModelError(e.toString()));
    }
  }
}
