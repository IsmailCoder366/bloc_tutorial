import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/posts/post_event.dart';
import 'package:bloc_tutorial/bloc/posts/post_state.dart';
import 'package:bloc_tutorial/repository/post_repository.dart';

import '../../model/post_model.dart';
import '../../utils/enums.dart';

class PostBloc extends Bloc<PostEvent, PostState>{

     List<PostModel> temPostList = [];
      PostRepository postRepository = PostRepository();
   PostBloc() : super(const PostState()){
      on<PostFetched>(fetchPostApi);
      on<SearchItem>(_filterList);
   }


   void fetchPostApi(PostFetched event, Emitter<PostState> emit)async{


      await postRepository.fetchPost().then((value){
         emit(state.copyWith(

            postStatus: PostStatus.success,
            message: 'success' ,
            postList: value

         ));
      }).onError((error, stackTrace){
         print(error);
         print(stackTrace);
         emit(state.copyWith(postStatus: PostStatus.failure, message: error.toString()));
      });
   }


   void _filterList(SearchItem event, Emitter<PostState> emit)async{

      if(event.stSearch.isEmpty){
         emit(state.copyWith(temPostList: [], searchMessage: ''));
      }else {
         temPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toString())).toList();
         if(temPostList.isEmpty){
            emit(state.copyWith(temPostList: temPostList, searchMessage: 'No Data Found'));
         }else{
            emit(state.copyWith(temPostList: temPostList));
         }
      }

      emit(state.copyWith(temPostList: temPostList));

   }
}