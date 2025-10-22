
import '../../home/model/card_item.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteUpdated extends FavoriteState {
  final List<CardItem> favorites;
  FavoriteUpdated(this.favorites);
}
