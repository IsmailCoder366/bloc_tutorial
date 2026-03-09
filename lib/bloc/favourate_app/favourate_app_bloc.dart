import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/favourate_app/faourate_app_event.dart';
import 'package:bloc_tutorial/bloc/favourate_app/favourate_app_state.dart';
import 'package:bloc_tutorial/model/favourite_item_model.dart';
import 'package:bloc_tutorial/repository/favourite_repository.dart';

class FavourateAppBloc  extends Bloc<FavouriteAppEvent, FavourateAppState>{


  List<FavouriteItemModel> favouriteList = [];
  FavouriteRepository favouriteRepository;
   FavourateAppBloc(this.favouriteRepository) : super(const FavourateAppState()){
    on<FetchFavouriteList>(fetchList);
   }

   void fetchList(FavouriteAppEvent event, Emitter<FavourateAppState> emit) async{
     favouriteList = await favouriteRepository.fetchItem();
     emit(state.copyWith(favouriteItemList: List.from(favouriteList), listStatus: ListStatus.success));
}
}