import 'package:bloc_tutorial/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../model/post_model.dart';

class PostState extends Equatable{


  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
});

  PostState copyWith({PostStatus? postStatus, List<PostModel>? postList, String? message }){
    return PostState(
    postList: postList ?? this.postList,
    postStatus: postStatus ?? this.postStatus,
    message: message ?? this.message,
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postList, message];

}