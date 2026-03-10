import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus{loading, success, failure}
class FavourateAppState extends Equatable{

  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tmpFavouriteItemList;

  final ListStatus listStatus;
  const FavourateAppState({
   this.favouriteItemList = const [],
   this.tmpFavouriteItemList = const [],
    this.listStatus = ListStatus.loading
});

  FavourateAppState copyWith({
    List<FavouriteItemModel>? favouriteItemList,
    List<FavouriteItemModel>? tmpFavouriteItemList,
    ListStatus? listStatus
  }) {
    return FavourateAppState(
    favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        tmpFavouriteItemList: favouriteItemList ?? this.tmpFavouriteItemList,
        listStatus:  listStatus ?? this.listStatus
    );
}
  @override
  // TODO: implement props
  List<Object?> get props => [favouriteItemList, tmpFavouriteItemList, listStatus];


}