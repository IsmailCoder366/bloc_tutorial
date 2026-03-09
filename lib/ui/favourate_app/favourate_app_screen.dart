import 'package:bloc_tutorial/bloc/favourate_app/faourate_app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourate_app/favourate_app_bloc.dart';
import '../../bloc/favourate_app/favourate_app_state.dart';

class FavourateAppScreen extends StatefulWidget {
  @override
  State<FavourateAppScreen> createState() => _FavourateAppScreenState();
}

class _FavourateAppScreenState extends State<FavourateAppScreen> {
  @override

  void initState() {
    super.initState();
    context.read<FavourateAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourate App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavourateAppBloc, FavourateAppState>(
            builder: (context, state){
              switch(state.listStatus){
                case ListStatus.loading:
                  return Center(child: CircularProgressIndicator());
                case ListStatus.failure:
                  return Text('error');
                  case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context, index){
                      final item = state.favouriteItemList[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.value.toString()),

                        ),
                      );
                    });
              }

        }),
      ),
    );
  }
}
