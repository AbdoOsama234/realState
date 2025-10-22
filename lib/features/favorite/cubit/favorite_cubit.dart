import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<Set<String>> {
  FavoriteCubit() : super(<String>{});

  bool isFav(String id) => state.contains(id);

  void toggle(String id) {
    final s = Set<String>.from(state);
    s.contains(id) ? s.remove(id) : s.add(id);
    emit(s);
  }

  void setAll(Iterable<String> ids) => emit(Set<String>.from(ids));
}
