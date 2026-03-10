import 'package:bloc_tutorial/bloc/posts/post_bloc.dart';
import 'package:bloc_tutorial/bloc/posts/post_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts/post_state.dart';
import '../utils/enums.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Screen')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Text(state.message.toString());
            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search with email',
                      border: OutlineInputBorder()
                    ),
                    onChanged: (filterKey){
                      context.read<PostBloc>().add(SearchItem(stSearch: filterKey));
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.postList.length,
                      itemBuilder: (context, index) {
                        final item = state.postList[index];
                        return ListTile(
                          title: Text(item.email.toString()),
                          subtitle: Text(item.body.toString()),
                        );
                      },
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
