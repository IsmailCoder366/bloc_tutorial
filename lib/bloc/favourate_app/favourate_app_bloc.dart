import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/favourate_app/faourate_app_event.dart';
import 'package:bloc_tutorial/bloc/favourate_app/favourate_app_state.dart';
import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:bloc_tutorial/repository/favourite_repository.dart';

class FavourateAppBloc  extends Bloc<FavouriteAppEvent, FavourateAppState>{


  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tmpfavouriteList = [];

  FavouriteRepository favouriteRepository;
   FavourateAppBloc(this.favouriteRepository) : super(const FavourateAppState()){
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
   }

   /// Fetch List of Items
   void fetchList(FetchFavouriteList event, Emitter<FavourateAppState> emit) async{
     favouriteList = await favouriteRepository.fetchItem();
     emit(state.copyWith(favouriteItemList: List.from(favouriteList), listStatus: ListStatus.success));
}

  /// Trigger favourite Icon
   void _addFavouriteItem(FavouriteItem event, Emitter<FavourateAppState> emit) async{
     final index = favouriteList.indexWhere((element) => element.id == event.item.id);
     favouriteList[index] = event.item;

     emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
}

  /// Select Item
  void _selectItem(SelectItem event, Emitter<FavourateAppState> emit) {

    tmpfavouriteList.add(event.item);

    emit(
        state.copyWith(
            tmpFavouriteItemList: List.from(tmpfavouriteList)
        )
    );
  }

  /// Unselect Item
  void _unSelectItem(UnSelectItem event, Emitter<FavourateAppState> emit) {

    tmpfavouriteList.remove(event.item);

    emit(
        state.copyWith(
            tmpFavouriteItemList: List.from(tmpfavouriteList)
        )
    );
  }


}