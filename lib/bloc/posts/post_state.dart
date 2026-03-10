import 'package:bloc_tutorial/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../model/post_model.dart';

class PostState extends Equatable{


  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.temPostList = const <PostModel>[],
    this.message = '',

});

  PostState copyWith({PostStatus? postStatus, List<PostModel>? postList, List<PostModel>? temPostList, String? message }){
    return PostState(
    postList: postList ?? this.postList,
      temPostList: temPostList ?? this.temPostList,
    postStatus: postStatus ?? this.postStatus,
    message: message ?? this.message,
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postList, message,temPostList];

}