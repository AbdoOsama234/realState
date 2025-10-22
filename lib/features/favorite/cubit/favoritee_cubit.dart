import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favoritee_state.dart';

class FavoriteeCubit extends Cubit<FavoriteeState> {
  FavoriteeCubit() : super(FavoriteeInitial());
}
